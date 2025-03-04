//
//  PurchaseView.swift
//  SearchDomainScrapBays
//
//  Created by Octo Siswardhono on 04/03/25.
//


import SwiftUI

struct PurchaseView: View {
    let domain: Domain
    @State private var years = 1
    @State private var showSuccessAlert = false
    var body: some View {
        VStack {
            Text(domain.domain)
                .font(.largeTitle)
                .bold()
                .padding(.top, 8)
                .padding(.horizontal, 8)
    
            VStack {
                Text("Registration price")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("$100")
                    .font(.title)
                    .bold()
                
                HStack {
                    Text("Years to register")
                    Spacer()
                    Button(action: { if years > 1 { years -= 1 } }) {
                        Image(systemName: "minus.circle")
                    }
                    Text("\(years) year")
                    Button(action: { years += 1 }) {
                        Image(systemName: "plus.circle")
                    }
                }
                .padding()
                
                Text("Domain privacy: Included")
                Text("SSL certificate: Included")
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding()
            
            Spacer()
            Button(action: {
                showSuccessAlert = true
            }) {
                Text("Purchase domain")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
            .alert(isPresented: $showSuccessAlert) {
                Alert(
                    title: Text("Success"),
                    message: Text("Your domain has been successfully purchased!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
