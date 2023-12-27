//
//  HomeViewModel.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var isDetail: Bool = false
    
    @AppStorage("balance") var balance: Int = 15000
    @AppStorage("isHouse_bought") var isHouse_bought: Bool = false
    @AppStorage("workers") var workers: [String] = []
}
