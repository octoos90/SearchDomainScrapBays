//
//  APIService.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//


import Foundation

// MARK: - APIService Implementation
class APIService: APIServiceProtocol {
    static let shared = APIService()
    
    private let baseURL = "https://api.domainsdb.info/v1/domains/search"

    // Shared JSONDecoder instance (for consistency)
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase // Handle snake_case keys
        return decoder
    }()

    // Fetch Domains using async/await
    func fetchDomains(query: String) async throws -> [Domain] {
        guard query.count >= 3 else { throw APIError.invalidQuery }
        
        // Build URL safely using URLComponents
        guard var components = URLComponents(string: baseURL) else {
            throw APIError.invalidURL
        }
        
        components.queryItems = [
            URLQueryItem(name: "domain", value: query)
        ]
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }

        // Perform async network request
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Validate response
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }

        // Decode response
        do {
            let decodedResponse = try jsonDecoder.decode(DomainSearchResponse.self, from: data)
            return decodedResponse.domains
        } catch {
            throw APIError.decodingFailed(error)
        }
    }
}
