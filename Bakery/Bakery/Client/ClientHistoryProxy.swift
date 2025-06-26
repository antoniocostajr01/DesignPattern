//
//  ClientHistoryProxy.swift
//  Bakery
//
//  Created by Antonio Costa on 29/05/25.
//

import Foundation

class ClientHistoryProxy: ClientHistory {
    let client: Client
    var realHistory: RealClientHistory?
    
    init(client: Client){
        self.client = client
    }
    
    func showHistory() {
        if realHistory == nil {
            realHistory = RealClientHistory(client: client)
        }
        realHistory?.showHistory()
    }
}
