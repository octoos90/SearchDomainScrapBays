//
//  DomainSearchViewModel.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//


import Foundation

class DomainSearchViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var domains: [Domain] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var hasSearched = false

    private let apiService: APIServiceProtocol
    private var debounceTask: Task<Void, Error>?

    // Inject APIService for testability
    init(apiService: APIServiceProtocol = APIService.shared) {
        self.apiService = apiService
    }

    // Debounce & Search Trigger
    func onSearchQueryChanged() {
        debounceTask?.cancel()
        hasSearched = false
        errorMessage = nil

        guard searchQuery.count >= 3 else {
            self.domains = []
            self.hasSearched = false
            return
        }

        // Debounce search (500ms delay)
        debounceTask = Task(priority: .userInitiated) {
            try await Task.sleep(nanoseconds: 500_000_000)
            
            if Task.isCancelled { return }

            DispatchQueue.main.async {
                self.hasSearched = true
                self.fetchDomains()
            }
        }
    }

    // Fetch domains using async/await
    func fetchDomains() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                let fetchedDomains = try await apiService.fetchDomains(query: searchQuery)
                DispatchQueue.main.async {
                    self.domains = fetchedDomains
                    self.errorMessage = fetchedDomains.isEmpty ? "No results found." : nil
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
}
