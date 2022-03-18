//
//  WordleXenditApp.swift
//  WordleXendit
//
//  Created by Faizal on 17/03/22.
//

import SwiftUI

@main
struct WordleXenditApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Wordle()
        }
    }
    
    
}
