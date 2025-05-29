//
//  main.swift
//  Bakery
//
//  Created by Antonio Costa on 22/05/25.
//

import Foundation


func showMenu() {
    print("""
    === Welcome to the Bakery ===
    You are: 
    1. Employee
    2. Manager
    
    Choose your option: 
    """)
    
    if let option = readLine() {
        switch option {
        case "1":
            System.shared.role = .Employee
            employeeMenu()
        case "2":
            System.shared.role = .Manager
            managerMenu()
        default:
            print("Invalid option.")
        }
    }
}

func employeeMenu() {
    while true {
        print("""
        ==== Employee Menu ====
        1. Make new order
        2. Show daily order
        0. Leave
        
        Choose your option:
        """)
        
        if let option = readLine() {
            switch option {
            case "1":
                makeOrder()
            case "2":
                showOrder()
            case "0":
                return
            default:
                print("Invalid Option")
            }
        }
    }
}
    
    
func managerMenu() {
    while true{
        print("""
        ==== Manager Menu ===
        1. Show Daily Order
        2. Show total Order Price
        0. Leave
        Choose your option: 
        """)
        
        if let option = readLine(){
            switch option {
            case "1":
                showOrder()
            case "2":
                let total = ManagerOrder.shared.calculateTotalOrders()
                print("Total sales of the day: $\(String(format: "%.2f", total))")
            case "0":
                return
            default:
                print("Invalid option")
            }
        }
    }
}


func makeOrder() {
    print("Costumer name: ")
    let costumer = readLine() ?? "Costumer"
    
    print("Itens: ")
    let itens = readLine()?.components(separatedBy: ",") ?? []
    
    print("Order value: ")
    let total = Double(readLine() ?? "") ?? 0.0
    
    let order = Order(client: costumer, itens: itens, totalPrice: total)
    ManagerOrder.shared.addOrder(order)
    print("Order registered!")
}


func showOrder() {
    let orders = ManagerOrder.shared.showOrders()
    if orders.isEmpty {
        print("There is no order registered yet.")
    } else {
        for (i, order) in orders.enumerated() {
            print("\nOrder \(i + 1):")
            print("Costumer: \(order.client)")
            print("Itens: \(order.itens.joined(separator: ", "))")
            print("Total Price: $ \(String(format: "%.2f", order.totalPrice))")
        }
    }
}

showMenu()
