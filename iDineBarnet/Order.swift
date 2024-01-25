//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

class Order : ObservableObject{
    @Published var orders = [orderItem]()

    var total: Int {
        if orders.count > 0 {
            return orders.reduce(0) { $0 + ($1.item.price * $1.count) }
        } else {
            return 0
        }
    }

    func add(item: MenuItem) {
        if let idx = orders.firstIndex(where: {$0.item == item}){
            orders[idx].count += 1
        }
        else {
            orders.append(orderItem(item: item, count: 1))
        }
    }

    func remove(item: MenuItem) {
        if let idx = orders.firstIndex(where:{$0.item == item }) {
            orders.remove(at: idx)
        }
    }
    
    func removeAll() {
        if !(orders.isEmpty){
            orders.removeAll()
        }
    }
}
