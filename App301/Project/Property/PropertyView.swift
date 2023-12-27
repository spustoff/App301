//
//  PropertyView.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct PropertyView: View {
    
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
                
                Text("Property")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.properties) { index in
                            
                            VStack(spacing: 25) {
                                
                                Image(index.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                
                                Text(index.title)
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .medium))
                                
                                Text("$\(index.price)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .medium))
                                    .padding(11)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
    }
}

#Preview {
    PropertyView()
}
