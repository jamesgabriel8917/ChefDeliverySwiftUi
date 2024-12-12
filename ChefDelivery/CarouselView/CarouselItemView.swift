//
//  CarouselItemView.swift
//  ChefDelivery
//
//  Created by James on 07/12/24.
//

import SwiftUI

struct CarouselItemView: View {
    
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}


