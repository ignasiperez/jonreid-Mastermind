import SwiftUI

@main
struct MastermindApp: App {
    var body: some Scene {
        WindowGroup {
            if isProduction {
                GameScreen(game: try! Game(numberOfCodeChoices: 2))
            }
        }
    }
    
    private var isProduction: Bool {
        NSClassFromString("XCTestCase") == nil
    }
}
