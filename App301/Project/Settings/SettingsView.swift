//
//  SettingsView.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = PropertyViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Balance: $\(viewModel.balance)")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding([.horizontal, .top])
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1eQ7U0f2xasUKHYzEfZJ21IIW04c4S0FSWtZ6n4fkSRo/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Usage Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 15, weight: .regular))
                        
                        Text("Rate Us")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
