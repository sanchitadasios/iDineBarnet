//
//  MenuDetailView.swift
//  iDineBarnet
//
//  Created by Sanchita Das on 06/02/24.
//

import SwiftUI

struct MenuDetailView: View {
    
    @EnvironmentObject var order : Order
    
    let item:MenuItem
    var body: some View {
        VStack{
            ZStack(alignment: .bottomTrailing){
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .foregroundStyle(.white)
                    .background(.black)
                    .offset(x: -5,y: -5)
            }
            Text(item.description)
                .padding()
            Button {
                order.add(item: item)
            } label: {
                Text("Add to Order")
            }
            .padding(2)
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack{
        MenuDetailView(item: MenuItem.example)
        .environmentObject(Order())
    }
}
