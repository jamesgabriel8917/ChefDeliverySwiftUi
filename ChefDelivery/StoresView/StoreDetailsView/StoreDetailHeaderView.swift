//
//  StoreDetailHeaderView.swift
//  ChefDelivery
//
//  Created by James on 16/12/24.
//

import SwiftUI

struct StoreDetailHeaderView: View {
    
    let store: StoreType
    
    var body: some View {
        VStack{
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
            }
        }
    }
}

#Preview {
    StoreDetailHeaderView(store: storesMock[0])
}
