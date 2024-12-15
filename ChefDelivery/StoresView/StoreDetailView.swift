//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by James on 10/12/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedProduct: ProductType?
    
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading){
                Image(store.headerImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                
                HStack{
                    Text(store.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(store.logoImage)
                    
                }
                
                HStack{
                    Text(store.location)
                    Spacer()
                    ForEach(1...store.stars, id: \.self){ _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                    }
                    
                }
                .padding(0)
                
                Text("Produtos")
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                ForEach(store.products){ product in
                    
                    Button{
                        selectedProduct = product
                    } label: {
                        HStack(spacing: 8){
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
                        .foregroundColor(.black)
                        .sheet(item: $selectedProduct){product in
                            ProductDetailView(product: product)
                        }
                    }
                    
                    
                    
                }
                
            }
            .navigationBarTitle(store.name)
            .padding(.vertical, 8)
            .padding(.horizontal)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack{
                            Image(systemName: "cart")
                            Text("Lojas")
                        }
                    }
                    .foregroundColor(Color("ColorRed"))
                }
            }
        }
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
