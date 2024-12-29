//
//  ProductType.swift
//  ChefDelivery
//
//  Created by James on 10/12/24.
//

import Foundation


struct ProductType: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$" + price.formatPrice()
    }
}


