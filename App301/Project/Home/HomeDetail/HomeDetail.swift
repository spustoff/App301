//
//  HomeDetail.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct HomeDetail: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Office LVL 1")
                    .foregroundColor(.black)
                    .font(.system(size: 15, weight: .medium))
                    .padding()
                    .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        Image("house")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .padding(30)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 9, content: {
                            
                            Text("Statistics")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                            
                            VStack(alignment: .leading, spacing: 15, content: {
                                
                                HStack(content: {
                                    
                                    Text("Money Made")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text("$\(25000)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                })
                                
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
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                    }
                                })
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        })
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeDetail()
}
