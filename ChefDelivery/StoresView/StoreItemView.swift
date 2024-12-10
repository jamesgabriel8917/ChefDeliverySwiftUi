//
//  StoreUiView.swift
//  ChefDelivery
//
//  Created by James on 09/12/24.
//

import SwiftUI

struct StoreUiView: View {
    
    let order: OrderType
    
    
    var body: some View {
        HStack{
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
                .padding()
            Text(order.name)
                .font(.subheadline)
        }
    }
}

#Preview {
    StoreUiView(order: OrderType(id: 1, name: "Monstro Burdger", image: "monstro-burger-logo"))
}
