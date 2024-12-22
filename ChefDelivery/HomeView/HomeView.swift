//
//  HomeView.swift
//  ChefDelivery
//
//  Created by James on 16/12/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffSet: CGSize = .zero
    let buttonHeight: CGFloat = 80
    @State private var buttonOffSet: GLfloat = 0
    @State private var showSecondScreen = false
    
    
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                // Primeiro ZStack
                ZStack {
                    Circle()
                        .foregroundColor(Color.colorRed)
                        .frame(width: isAnimating ? 200 : 0)
                        .position(x: 50, y: 100)
                        .blur(radius: 60)
                        .opacity(isAnimating ? 0.5 : 0)
                    
                    Circle()
                        .foregroundColor(Color.colorRed)
                        .frame(width: isAnimating ? 200 : 0)
                        .position(x: geometry.size.width - 100, y: geometry.size.height - 200)
                        .blur(radius: 60)
                        .opacity(isAnimating ? 0.5 : 0)
                    
                    VStack {
                        Text("Chef Delivery")
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.colorRed)
                            .opacity(isAnimating ? 1 : 0)
                            .offset(y: isAnimating ? 0 : -40)
                        
                        Text("Arrasta pro lado ai chefe")
                            .font(.title2)
                            .padding()
                            .multilineTextAlignment(.center)
                            .offset(y: isAnimating ? 0 : -40)
                        Text("Confia")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .offset(y: isAnimating ? 0 : -40)
                        
                        Image("nice-meme")
                            .resizable()
                            .scaledToFit()
                            .shadow(radius: 60)
                            .padding(isAnimating ? 32 : 92)
                            .opacity(isAnimating ? 1 : 0)
                            .offset(x: imageOffSet.width, y: imageOffSet.height)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        withAnimation(.easeOut(duration: 0.5)) {
                                            imageOffSet = gesture.translation
                                        }
                                    }
                                    .onEnded { _ in
                                        withAnimation(.easeInOut(duration: 0.5)) {
                                            imageOffSet = .zero
                                        }
                                    }
                            )
                    }
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.9)) {
                            isAnimating = true
                        }
                    }
                }
                
                // Segundo ZStack na parte inferior
                ZStack {
                    Capsule()
                        .fill(Color.colorRed)
                        .opacity(0.5)
                    Capsule()
                        .fill(Color.colorRed)
                        .opacity(0.5)
                        .padding(8)
                    Text("Descubra mais")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.colorRedDark)
                        .offset(x: 20)
                    HStack{
                        Capsule()
                            .fill(Color.colorRed)
                            .frame(width: CGFloat(Int(buttonOffSet)+Int(buttonHeight)))
                        Spacer()
                    }
                    
                    
        
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundColor(Color.colorRed)
                        
                            Circle()
                                .foregroundColor(Color.colorRedDark)
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                                .bold()
                        }
                        
                        Spacer()
                    }
                    .offset(x: CGFloat(buttonOffSet))
                    .gesture(
                        DragGesture()
                            .onChanged({gesture in
                                if gesture.translation.width > 0{
                                    if  buttonOffSet <= (Float(geometry.size.width) - (60+80)){
                                        buttonOffSet = GLfloat(gesture.translation.width)
                                    }
                                    
                                }
                                
                            })
                            .onEnded({ _ in
                                
                                if Int(buttonOffSet) > Int((geometry.size.width - 60) / 2) {
                                    //navegar para a proxima tela
                                    showSecondScreen = true
                                }else{
                                    buttonOffSet = 0
                                }
                            })
                    )
                }
                .frame(width: geometry.size.width - 60, height: buttonHeight)
                .position(x: geometry.size.width / 2, y: geometry.size.height - buttonHeight / 2 - 20) // Posiciona na parte inferior
            }
            .fullScreenCover(isPresented: $showSecondScreen){
                ContentView()
            }
        }
    }
}


#Preview {
    HomeView()
}
