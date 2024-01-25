//
//  ContentView.swift
//  iDineBarnet
//
//  Created by Sanchita Das on 25/01/24.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationStack {
            List{
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                            .isDetailLink(false)
                        }
                    }
                }
            }
            .navigationDestination(for: MenuItem.self){ item in
                MenuDetailView(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}
