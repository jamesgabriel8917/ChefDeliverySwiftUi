//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by James on 06/12/24.
//

import SwiftUI

struct OrderTypeView: View {
    
    let orderType: OrderType
    
    var body: some View {
        VStack (spacing: 5){
            Image(orderType.image)
                .cornerRadius(20)
            Text(orderType.name)
        }
    }
}

#Preview {
    OrderTypeView(orderType: OrderType(id: 1, name: "Restaurantes", image: "hamburguer"))
        .previewLayout(.sizeThatFits)
}

