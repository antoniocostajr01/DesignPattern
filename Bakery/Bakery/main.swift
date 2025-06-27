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
    let invoker = MenuInvoker()
    invoker.register(option: "1", command: MakeOrderCommand())
    invoker.register(option: "2", command: ShowOrderCommand())
    invoker.register(option: "0", command: ExitCommands())
    
    while true {
        print("""
        ==== Employee Menu ====
        1. Make new order
        2. Show daily order
        0. Leave
        Choose your option:
        """)
        
        guard let option = readLine() else { continue }
        if option == "0"{ break }
        invoker.execute(option: option)
    }
}
    
    
func managerMenu() {
    while true{
        print("""
        ==== Manager Menu ===
        1. Show Daily Order
        2. Show total Order Price
        3. Show Client History
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
            case "3":
                showClientHistory()
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
    let name = readLine() ?? "Unknown"
    let client = Client(name: name, id: UUID())
    
    print("Itens: ")
    let itens = readLine()?.components(separatedBy: ",") ?? []
    
    print("Order value: ")
    let total = Double(readLine() ?? "") ?? 0.0
    
    let order = Order(client: client , itens: itens, totalPrice: total)
    ManagerOrder.shared.addOrder(order)
    print("Order registered!")
    
    let proxyHistory = ClientHistoryProxy(client: client)
    proxyHistory.showHistory()
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

func showClientHistory() {
    print("Write the costumer name: ")
    
    let name = readLine() ?? "Unknown"
    
    let costumer = Client(name: name, id: UUID())
    let history = ClientHistoryProxy(client: costumer)
    history.showHistory()
}

showMenu()
