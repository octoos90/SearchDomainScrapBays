//
//  SearchView.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//


import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = DomainSearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Custom Styled Search Bar
                TextField("Search for a domain...", text: $viewModel.searchQuery)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.black)
                .padding(.horizontal, 12)
                .frame(height: 50)
                .background(Color.white)
                .multilineTextAlignment(.center)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .onChange(of: viewModel.searchQuery) {
                    viewModel.onSearchQueryChanged()
                }

                // Loading Indicator
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding(.top, 20)
                }
                // Error or Empty State Message (Only show after first search)
                else if viewModel.hasSearched {
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 20)
                    } else if viewModel.domains.isEmpty {
                        Text("No domains found.")
                            .foregroundColor(.gray)
                            .padding(.top, 20)
                    }
                }
            }
            .padding(.top, 20)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
