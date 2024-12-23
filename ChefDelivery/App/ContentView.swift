//
//  ContentView.swift
//  ChefDelivery
//
//  Created by James on 05/12/24.
//

import SwiftUI

struct ContentView: View {
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
            fetchData()
        }
    }
    
    func fetchData(){
        let url = URL(string: "https://polls.apiblueprint.org/questions")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let data = data {
                let decoder = JSONDecoder()
                print(data)
            }
        }.resume()
        
        
        
    }
}

#Preview {
    ContentView()
}

