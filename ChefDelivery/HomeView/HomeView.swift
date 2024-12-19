//
//  HomeView.swift
//  ChefDelivery
//
//  Created by James on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geometry in
            
            
            ZStack{
                
                Circle()
                    .foregroundColor(Color.colorRed)
                    .frame(width: 200)
                    .position(x: 50, y: 100)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                Circle()
                    .foregroundColor(Color.colorRed)
                    .frame(width: 200)
                    .position(x: geometry.size.width - 50, y: geometry.size.height - 50)
                    .blur(radius: 60)
                    .opacity(0.5)
                
                
                VStack{
                    Text("Chef Delivery")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.colorRed)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Peça a sua refeição no conforto do seu lar")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    
                    
                    Spacer()
                }
                .onAppear{
                    
                    withAnimation(.easeInOut(duration: 3)){
                        isAnimating = true
                    }
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
