//
//  NavigationBar.swift
//  ChefDelivery
//
//  Created by James on 05/12/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack{
            Spacer()
            Button("R. Nicanor Sganzerla 556") {
                
            }.font(.subheadline)
                .fontWeight(.semibold)
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .foregroundColor(.red)
            }

        }
    }
}

#Preview {
    NavigationBar()
        .padding()
}
