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
            if isProduction {
                GameScreen()
            }
        }
    }
    
    private var isProduction: Bool {
        NSClassFromString("XCTestCase") == nil
    }
}
