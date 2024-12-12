//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by James on 09/12/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    
    var body: some View {

            VStack(alignment: .leading, spacing: 30){
                VStack (alignment: .leading){
                    VStack{
                        Text(title)
                            .font(.headline)
                    }
                    .padding()
                ForEach(storesMock){ mock in
                    NavigationLink {
                        StoreDetailView(store: mock)
                    } label: {
                        StoreItemView(store: mock)
                    }

                    
                }
                }.foregroundColor(.black)
        }
            .padding()
    }
}

#Preview {
    StoresContainerView()
}
