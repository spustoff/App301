//
//  HomeView.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
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
                
                Text("Home")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.horizontal, .bottom])
                
                Button(action: {
                    
                    viewModel.isDetail = true
                    
                }, label: {
                    
                    Image("house")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(30)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding(.horizontal)
                })
                .opacity(viewModel.isHouse_bought ? 1 : 0.5)
                .disabled(viewModel.isHouse_bought ? false : true)
                
                if viewModel.isHouse_bought {
                    
                    VStack(alignment: .leading, spacing: 9, content: {
                        
                        Text("Workers")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                
                                ForEach(["Duglas", "Matthew", "Steve", "John", "Alex", "Robert"], id: \.self) { index in
                                
                                    VStack(alignment: .leading, spacing: 8, content: {
                                        
                                        HStack(alignment: .top, content: {
                                            
                                            Image("worker")
                                            
                                            Text(index)
                                                .foregroundColor(.black)
                                                .font(.system(size: 17, weight: .medium))
                                        })
                                        
                                        Button(action: {
                                            
                                            if !viewModel.workers.contains(index) {
                                                
                                                if viewModel.balance >= 5000 {
                                                    
                                                    withAnimation(.spring()) {
                                                        
                                                        viewModel.workers.append(index)
                                                    }
                                                    
                                                    viewModel.balance -= 5000
                                                }
                                            }
                                            
                                        }, label: {
                                            
                                            Text(viewModel.workers.contains(index) ? "$25.856/HOUR" : "$\(5000)")
                                                .foregroundColor(.white)
                                                .font(.system(size: 13, weight: .medium))
                                                .padding(11)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                                        })
                                        .opacity(viewModel.balance < 5000 && !viewModel.workers.contains(index) ? 0.5 : 1)
                                        .disabled(viewModel.balance < 5000 && !viewModel.workers.contains(index) ? true : false)
                                    })
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                }
                            })
                        }
                    })
                    .padding([.horizontal, .top])
                    
                } else {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("Cost: $\(10000)")
                            .foregroundColor(.black)
                            .font(.system(size: 21, weight: .semibold))
                        
                        Button(action: {
                            
                            if viewModel.balance >= 10000 {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isHouse_bought = true
                                }
                                
                                viewModel.balance -= 10000
                            }
                            
                        }, label: {
                            
                          Text("BUY THIS OFFICE")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(11)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        })
                        
                        Spacer()
                    })
                    .padding()
                }
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            HomeDetail()
        })
    }
}

#Preview {
    HomeView()
}
