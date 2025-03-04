//
//  APIError.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidQuery
    case invalidResponse
    case decodingFailed(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL format."
        case .invalidQuery:
            return "Query must be at least 3 characters."
        case .invalidResponse:
            return "Invalid server response."
        case .decodingFailed(let error):
            return "Failed to decode data: \(error.localizedDescription)"
        }
    }
}
