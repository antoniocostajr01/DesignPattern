//
//  ManagerOrder.swift
//  Bakery
//
//  Created by Antonio Costa on 23/05/25.
//


// Singleton that manage all the orders

import Foundation

class ManagerOrder {
    static let shared = ManagerOrder()
    private init() {}
    
    private var orders: [Order] = []
    
    func addOrder(_ order: Order) {
        orders.append(order)
    }
    
    func showOrders() -> [Order] {
        return orders
    }
    
    func calculateTotalOrders() -> Double {
        return orders.reduce(0.0) {$0 + $1.totalPrice}
    }
}
