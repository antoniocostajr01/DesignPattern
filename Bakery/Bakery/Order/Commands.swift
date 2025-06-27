//
//  Commands.swift
//  Bakery
//
//  Created by Antonio Costa on 26/06/25.
//

import Foundation

protocol Commands{
   func execute()
}

class MakeOrderCommand: Commands {
    func execute() {
        makeOrder()
    }
}

class ShowOrderCommand: Commands {
    func execute() {
        showMenu()
    }
}

class ShowTotalSalesCommand: Commands {
  func execute() {
    let total = ManagerOrder.shared.calculateTotalOrders()
    print("Total sales of the day: $\(total)")
  }
}

class ShowClientHistoryCommands: Commands {
    func execute() {
        showClientHistory()
    }
}

class ExitCommands: Commands { func execute() {} }

class MenuInvoker {
    private var commands = [String: Commands]()

    func register(option: String, command: Commands) {
        commands[option] = command
    }

    func execute(option: String) {
        if let command = commands[option] {
            command.execute()
        } else {
            print("Invalid option")
        }
    }
}



