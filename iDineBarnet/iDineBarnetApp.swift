//
//  iDineBarnetApp.swift
//  iDineBarnet
//
//  Created by Sanchita Das on 25/01/24.
//

import SwiftUI

@main
struct iDineBarnetApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            mainView()
                .environmentObject(order)
        }
    }
}
