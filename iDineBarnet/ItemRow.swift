//
//  ItemRow.swift
//  iDineBarnet
//
//  Created by Sanchita Das on 06/02/24.
//

import SwiftUI

struct ItemRow: View {
//    let item: MenuItem = Bundle.main.decode(MenuItem.self, from:"Menu.json")
    let item: MenuItem
    let colors : [String: Color] = ["D" : .purple, "V" : .green, "G" : .black, "N" : .red]
    var body: some View {
//        Text(item.price)
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading, content: {
                Text(item.name)
                Text("$\(item.price)")
            })
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .padding(5)
                    .foregroundStyle(.white)
                    .background(colors[restriction, default:.black])
                    .clipShape(Circle())
                    .fontWeight(.black)
            }
        }
        
    }
}
#Preview {
    ItemRow(item: MenuItem.example)
}
