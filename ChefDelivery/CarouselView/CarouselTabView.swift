//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by James on 07/12/24.
//

import SwiftUI

struct CarouselTabView: View {
    
    @State private var currentindex = 1
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "", image: "brazilian-meal-banner"),
        OrderType(id: 2, name: "", image: "barbecue-banner"),
        OrderType(id: 3, name: "", image: "pokes-banner")
    ]
    var body: some View {
        TabView(selection: $currentindex){
            ForEach(ordersMock){ mock in
                CarouselItemView(order: mock)
                    .tag(mock.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear(){
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true){_ in
                
                withAnimation(.easeInOut(duration: 1)){
                    currentindex = currentindex == ordersMock.count ? 0 : currentindex + 1
                }
                
            }
        }
        
    }
}

#Preview {
    CarouselTabView()
}


