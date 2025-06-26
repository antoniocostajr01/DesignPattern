//
//  System.swift
//  Bakery
//
//  Created by Antonio Costa on 22/05/25.
//

import Foundation

enum User {
    case Employee, Manager
}

struct Client {
    let name: String
    let id: UUID
}

//Singleton that manage the acess
class System {
    static let shared = System()
    private init() {}
    
    var role: User?
}


