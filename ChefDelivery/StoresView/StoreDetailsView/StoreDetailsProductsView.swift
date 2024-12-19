//
//  StoreDetailsProductsView.swift
//  ChefDelivery
//
//  Created by James on 16/12/24.
//

import SwiftUI

struct StoreDetailsProductsView: View {
    
    let store: StoreType
    @State private var selectedProduct: ProductType?
    
    
    var body: some View {
        Text("Produtos")
            .font(.title)
            .bold()
            .padding(.top)
        
        ForEach(store.products){ product in
            
            Button{
                selectedProduct = product
            } label: {
                HStack(spacing: 8){
                    StoreDetailProductItemView(product: product)
                    
                }
                .foregroundColor(.black)
                .sheet(item: $selectedProduct){product in
                    ProductDetailView(product: product)
                }
            }
        }    }
}

#Preview {
    StoreDetailsProductsView(store: storesMock[0])
}
