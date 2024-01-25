//
//  mainView.swift
//  iDineBarnet
//
//  Created by Sanchita Das on 06/02/24.
//

import SwiftUI

extension TabView{
    
}

struct mainView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "fork.knife.circle")
                }
                
            orderView()
                .tabItem {
                    Label("Order", systemImage: "cart.circle")
                }
                .badge(order.orders.count)
        }
    }
}

#Preview {
    mainView()
        .environmentObject(Order())
}
