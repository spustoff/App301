//
//  StatisticsView.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct StatisticsView: View {
    
    @State var isGraph: Bool = false
    
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
                
                Text("Statistics")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        
                        Text("Popular value")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("EUR/USD")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        isGraph = true
                        
                    }, label: {
                        
                        Text("OPEN GRAPH")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .medium))
                            .padding(11)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    })
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding(.horizontal)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6, content: {
                        
                        Text("Money Earned")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                        
                        Text("$0")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                    })
                    
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                .padding(.horizontal)
                
                HStack {
                    
                    ZStack {
                        
                        Circle()
                            .stroke(Color("primary"), lineWidth: 4)
                            .frame(width: 110, height: 110)

                        VStack(spacing: 6) {
                            
                            Text("\(viewModel.workers.count)")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text("WORKERS")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    
                    Spacer()
                    
                    ZStack {
                        
                        Circle()
                            .fill(Color("primary"))
                            .frame(width: 110, height: 110)

                        VStack(spacing: 6) {
                            
                            Text("$\(0)")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text("SPENT")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .sheet(isPresented: $isGraph, content: {
            
            Graph()
        })
    }
}

#Preview {
    StatisticsView()
}
