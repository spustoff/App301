//
//  LoadingView.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            ProgressView()
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
        }
    }
}

#Preview {
    LoadingView()
}
