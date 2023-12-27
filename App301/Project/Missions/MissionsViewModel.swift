//
//  MissionsViewModel.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

final class MissionsViewModel: ObservableObject {
    
    @AppStorage("balance") var balance: Int = 15000
    @AppStorage("isHouse_bought") var isHouse_bought: Bool = false
    @AppStorage("workers") var workers: [String] = []
    
    @Published var missions: [Int] = [10000, 50000, 100000, 500000, 1000000, 5000000, 10000000]
}
