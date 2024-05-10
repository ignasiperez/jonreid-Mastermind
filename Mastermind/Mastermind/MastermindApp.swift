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
