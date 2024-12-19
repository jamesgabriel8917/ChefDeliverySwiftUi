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
    
    

    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            StoreDetailHeaderView(store: store)
            StoreDetailsProductsView(store: store)
            
            
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

#Preview {
    StoreDetailView(store: storesMock[0])
}
