//
//  CheckOutView.swift
//  iDineBarnet
//
//  Created by Sanchita Das on 07/02/24.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    let paymentTypes = ["cash", "card", "iDine Loyalty Points"]
    let tips = [10,15,20,25,0]
    
    @State private var paymentTypeSelected = "Cash"
    @State private var possessLoyaltyCard = false
    @State private var loyaltyCardNumber = ""
    @State private var tip = 10
    @State private var showingPaymentAlert = false
    @State private var navigateToMenu = false
    
    var totalValue : String {
        let total = Double(order.total)
        let tipValue = total/100*Double(tip)
        return (total+tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    Picker("How do you want to pay?", selection: $paymentTypeSelected){
                        ForEach(paymentTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    Toggle("Do you have Loyalty Card", isOn: $possessLoyaltyCard.animation())
                    if (possessLoyaltyCard){
                        TextField("Enter your loyalty card Number",text: $loyaltyCardNumber)
                    }
                }
                Section("Add a tip?"){
                    Picker("Percentage:", selection: $tip){
                        ForEach(tips, id:\.self){
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total: \(totalValue)"){
                    Button("Confirm Order") {
                        showingPaymentAlert.toggle()
                    }
                }
            }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
                Button("Ok") {
                    order.removeAll()
//                    self.shouldPopToRoot = false
                    navigateToMenu.toggle()
//                    ContentView()
                }
            } message: {
                Text("Your total was \(totalValue) - Thank You!")
            }
            .navigationDestination(isPresented: $navigateToMenu){
                
            }

        }
    }
}

#Preview {
    CheckOutView()
        .environmentObject(Order())
//        .navigationTitle(")
}
