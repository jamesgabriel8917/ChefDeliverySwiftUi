//
//  StoreDetailProductItemView.swift
//  ChefDelivery
//  Created by James on 16/12/24.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    
    let product: ProductType
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8){
                Text(product.name)
                    .bold()
                Text(product.description)
                Text(product.formattedPrice)
                
            }
            
            Spacer()
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(radius: 10, x: 6, y: 8)
        }
       
    }
}


#Preview {
    StoreDetailProductItemView(product: storesMock[0].products[0])
}
