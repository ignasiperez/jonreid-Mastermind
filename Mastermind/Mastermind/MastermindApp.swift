//
//  MastermindApp.swift
//  Mastermind
//
//  Created by Ignasi Perez-Valls on 7/5/24.
//

import SwiftUI

@main
struct MastermindApp: App {
    var body: some Scene {
        WindowGroup {
            if isProcution {
                ContentView()
            }
        }
    }
    
    private var isProcution: Bool {
        NSClassFromString("XCTestCase") == nil
    }
}
