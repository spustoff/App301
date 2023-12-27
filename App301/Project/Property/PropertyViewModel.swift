//
//  PropertyViewModel.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI

final class PropertyViewModel: ObservableObject {
    
    @AppStorage("balance") var balance: Int = 15000
    @AppStorage("isHouse_bought") var isHouse_bought: Bool = false
    @AppStorage("workers") var workers: [String] = []
    
    @AppStorage("bought_property") var bought_property: [String] = []
    
    @Published var properties: [PropertyModel] = [
    
        PropertyModel(title: "Lamborghini", image: "car", price: 135800402900),
        PropertyModel(title: "Helicopter", image: "helicopter", price: 10043859043),
        PropertyModel(title: "Hotel", image: "hotel", price: 550985552250),
        PropertyModel(title: "Yacht", image: "yacht", price: 982158985552),
    ]
}

struct PropertyModel: Identifiable {
    
    var id = UUID().uuidString
    
    var title: String
    var image: String
    
    var price: Int
}
