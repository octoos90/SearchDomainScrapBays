//
//  APIServiceProtocol.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//


protocol APIServiceProtocol {
    func fetchDomains(query: String) async throws -> [Domain]
}
