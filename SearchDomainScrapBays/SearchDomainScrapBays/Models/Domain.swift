//
//  Domain.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//


import Foundation

struct Domain: Identifiable, Codable {
    var id: String { domain }
    let domain: String
    let isDead: Bool
   
    // Custom init when decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        domain = try container.decode(String.self, forKey: .domain)
        
        let isDeadString = try container.decode(String.self, forKey: .isDead)
        isDead = isDeadString.lowercased() == "false" ? false : true
    }
}
