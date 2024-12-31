//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by James on 14/12/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State var productQuantity: Int = 1

    
    var body: some View {
        VStack{
            ProductDetailHeaderView(product: product)
            
            Spacer()

            ProductDetailQuantityView(ProductQuantity: $productQuantity)

            Spacer()
            
            //Botao de adicionar ao carrinho
            VStack{
                
                Button(action: {
                    print("Botao pressionado \(productQuantity)")
                }){
                    Image(systemName: "cart")
                    Text("Enviar pedido")
                }
            }.foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.colorRed)
                .cornerRadius(50)
                .shadow(color: Color.colorRedDark, radius: 5, x: 0, y: 5)
            
        }
        .foregroundColor(.black)
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
