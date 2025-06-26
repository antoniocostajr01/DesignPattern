//
//  ClientData.swift
//  Bakery
//
//  Created by Antonio Costa on 29/05/25.
//

import Foundation

protocol ClientData {
    func showCostumerHistory(name: String)
}


class realClientData: ClientData {
    func showCostumerHistory(name: String) {
        let list = ManagerOrder.shared.showOrders()
        
        if list.isEmpty {
            print("There is no one client on the list")
        } else {
            print("Cliente History Order:")
            for (i, order) in list.enumerated() {
                print("""
                Order: \(i+1)
                Itens: \(order.itens.joined(separator: ", "))
                Total: $\(String(format: "%.2f", order.totalPrice))
                """)
            }
        }
    }
    
    
}
