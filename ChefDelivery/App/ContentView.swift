//
//  ContentView.swift
//  ChefDelivery
//
//  Created by James on 05/12/24.
//

import SwiftUI

struct ContentView: View {
    
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 0){
                NavigationBar()
                    .padding(.horizontal, 15)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                        
                        
                    }
                }
            }
        }
        .onAppear(){
            Task{
                await getStores()
            }
        }
    }
    
    
    func getStores() async {
        do{
            let result = try await service.fetchData()
            
            switch result{
            case .success(let stores):
                self.storesType = stores
                
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }catch{
            print(error.localizedDescription)
        }
        
    }
}

#Preview {
    ContentView()
    
}
