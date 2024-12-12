//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by James on 10/12/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    
    var body: some View {
        VStack{
            Image(store.headerImage)
                .resizable()
                .scaledToFill()
            
        }
        .navigationBarTitle("Store Detail")
        
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
