//
//  ResultsView.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//


import SwiftUI

struct ResultsView: View {
    let domains: [Domain]
    var body: some View {
        VStack {
            List {
                ForEach(domains) { domain in
                    ZStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(domain.domain)
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            
                            Text(domain.isDead ? "Not Available" : "Available")
                                .foregroundColor(domain.isDead ? .red : .green)
                                .font(.subheadline)
                        }
                        .padding()
                        .frame(maxWidth: 350, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                        NavigationLink(destination: PurchaseView(domain: domain)) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .opacity(0)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}
