//
//  TabBar.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.white : Color.white.opacity(0.4))
                            .frame(height: 22)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color.white : Color.white.opacity(0.4))
                            .font(.system(size: 12, weight: .regular))
                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(Color("tabbar"))
    }
}

enum Tab: String, CaseIterable {
    
    case Statistics = "Statistics"
    
    case Missions = "Missions"
    
    case Home = "Home"
    
    case Property = "Property"
    
    case Settings = "Settings"
    
}

#Preview {
    
    ContentView()
}
