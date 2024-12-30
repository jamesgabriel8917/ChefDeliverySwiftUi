//
//  StoresContainerView.swift
//  ChefDelivery
//
//  Created by James on 09/12/24.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    @State private var ratingFilter = 0
    //distance in kilometer
    @State private var distanceFilter = 20
    
    var stores: [StoreType]
    
    var filteredSotres: [StoreType] {
        return stores.filter{ store in
            store.stars >= ratingFilter &&
            store.distance <= Double(distanceFilter)
        }
    }
    
    
    var body: some View {

            VStack(alignment: .leading, spacing: 30){
                VStack (alignment: .leading){
                    HStack{
                        Text(title)
                            .font(.headline)
                        
                        Spacer()
                        
                        Menu("Distancia"){
                            Button{
                                distanceFilter = 20
                            } label: {
                                Text("Limpar filtro")
                            }
                            
                            ForEach(Array(stride(from: 0, to: 21, by: 5)), id: \.self) { i in
                                Button {
                                    distanceFilter = i
                                } label: {
                                    Text("Até \(i) km")
                                }
                            }
                        }
                        
                        Menu("Avaliaçao"){
                            Button{
                                ratingFilter = 0
                            } label: {
                                Text("Limpar filtro")
                            }
                            Divider()
                            
                            ForEach(1...5, id: \.self){ rating in
                                Button{
                                    ratingFilter = rating
                                } label: {
                                    if rating == 1{
                                        Text("\(rating) estrela ou mais")
                                    }else if rating == 5 {
                                        Text("\(rating) estrelas")
                                    }else{
                                        Text("\(rating) estrelas ou mais")
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    .padding()
                    if filteredSotres.isEmpty{
                        Text("Nenhum resultado")
                            .bold()
                            .font(.title2)
                            .foregroundColor(Color.colorRed)
                            .padding(.vertical, 32)
                            .frame(maxWidth: .infinity)
                    }
                    ForEach(filteredSotres){ mock in
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
    StoresContainerView(stores: storesMock)
}
