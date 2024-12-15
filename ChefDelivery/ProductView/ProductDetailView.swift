//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by James on 14/12/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    
    @State var ProductQuantity = 1
    
    var body: some View {
        VStack{
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
            
            Spacer()
            
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
            
            Spacer()
            
            //Botao de adicionar ao carrinho
            VStack{
                
                Button(action: {}){
                    Image(systemName: "cart")
                    Text("Adicionar ao carrinho")
                }
            }.foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.colorRed)
                .cornerRadius(50)
                .shadow(color: Color.colorRedDark, radius: 5, x: 0, y: 5)
            
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}
