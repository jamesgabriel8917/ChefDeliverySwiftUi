//
//  ProductDetailHeaderView.swift
//  ChefDelivery
//
//  Created by James on 16/12/24.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    
    let product: ProductType
    
    var body: some View {
        Image(product.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 20)
        VStack(alignment: .leading, spacing: 15){
            Text(product.name)
                .font(.title)
                .bold()
            
            Text(product.description)
                .font(.subheadline)
            
            Text(product.formattedPrice)
                .font(.title3)
                .bold()
        }
        .padding()
    }
}

#Preview {
    ProductDetailHeaderView(product: storesMock[0].products[0])
}
