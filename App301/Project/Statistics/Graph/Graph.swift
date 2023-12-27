//
//  Graph.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct Graph: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("EUR/USD")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Currency value")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .semibold))
                    
                    HStack(alignment: .center, spacing: 5, content: {
                        
                        Text("$\(Int.random(in: 1...22000))")
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("+\(Int.random(in: 1...50))%")
                            .foregroundColor(.green)
                            .font(.system(size: 14, weight: .regular))
                        
                        Spacer()
                    })
                })
                .padding([.horizontal, .top])
                
                Image("graph")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Back")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                    })
                }
                .padding()
            }
        }
    }
}

#Preview {
    Graph()
}
