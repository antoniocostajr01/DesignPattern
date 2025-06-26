//
//  RealClienHistoryProxy.swift
//  Bakery
//
//  Created by Antonio Costa on 05/06/25.
//

import Foundation


protocol ClientHistory{
    func showHistory()
}

class RealClientHistory: ClientHistory {
    private let client: Client

    init(client: Client){
        self.client = client
        loadHistoryFromDataBase()
    }
    
    private func loadHistoryFromDataBase(){
        print("Loading history from client: \(client.name)...")
    }
    func showHistory() {
        
        print("Showing history from client: \(client.name)")
        
        let orders = ManagerOrder.shared.showOrders().filter { $0.client.id == client.id }
        if orders.isEmpty {
            print("There are no orders for this client.")
        } else {
            for order in orders{
                print("- Itens: \(order.itens.joined(separator: ", ")), Valor: \(order.totalPrice)")
            }
        }
        
    }
}
