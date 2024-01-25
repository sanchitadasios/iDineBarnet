//
//  orderView.swift
//  iDineBarnet
//
//  Created by Sanchita Das on 06/02/24.
//

import SwiftUI

struct orderView: View {
    @EnvironmentObject var order : Order
//    @State private var countString = "1"
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.orders, id: \.self) { orderItem in
                        HStack{
//                            Text()
                            VStack(alignment: .leading, content: {
                                Text(orderItem.item.name)
                                Text("Quantity: \(orderItem.count)")
                                    .font(.subheadline)
                            })
                            
                            //                           TextField("\(orderItem.count)", text: $countString)

                            Spacer()
                            Text("$\(orderItem.item.price)")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        order.orders.remove(atOffsets: indexSet)
                    })
                }
                Section{
                    NavigationLink("Place Order"){
                        CheckOutView()
                    }
                    .isDetailLink(false)
                }
                .disabled(order.orders.isEmpty)
            }
            .navigationTitle("Order")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#Preview {
    orderView()
        .environmentObject(Order())
}
