//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by James on 16/12/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @Binding var ProductQuantity: Int
    
    var body: some View {
        //QUantidade
        VStack(spacing: 15){
            Text("Quantidade")
                .bold()
                .font(.title3)
            
            HStack{
                Button(action: {
                    if(ProductQuantity>0){
                        ProductQuantity -= 1
                    }
                    
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.colorRed)
                })
                Text("\(ProductQuantity)")
                
                Button(action: {
                    ProductQuantity += 1
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.colorRed)
                        
                })
                
            }
        }

    }
}

#Preview {
    ProductDetailQuantityView(ProductQuantity: .constant(1))
}
