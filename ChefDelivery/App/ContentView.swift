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
    
    @State private var isLoading = true
    
    var body: some View {
        NavigationStack {
            if(isLoading){
                ProgressView()
            }else{
                VStack (spacing: 0){
                    NavigationBar()
                        .padding(.horizontal, 15)
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
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

        let result = await service.fetchData()
        
        switch result{
        case .success(let stores):
            self.storesType = stores
            self.isLoading = false
        case .failure(let error):
            self.isLoading = false
            print("Erro ao retornar dados: "+error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()

}

