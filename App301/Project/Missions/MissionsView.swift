//
//  MissionsView.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct MissionsView: View {
    
    @StateObject var viewModel = MissionsViewModel()
    
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
                
                Text("Missions")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.missions, id: \.self) { index in
                        
                            VStack(alignment: .center, spacing: 8, content: {
                                
                                Image("money_icon")
                                
                                Text("Make $\(index)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color("primary").opacity(0.2))
                                    .frame(height: 6)
                                
                                Text("REWARD EUR/USD")
                                    .foregroundColor(.white)
                                    .font(.system(size: 12, weight: .medium))
                                    .padding(11)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        }
                    })
                    .padding([.horizontal, .bottom])
                }
            }
        }
    }
}

#Preview {
    MissionsView()
}
