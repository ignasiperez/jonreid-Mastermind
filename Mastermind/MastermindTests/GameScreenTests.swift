@testable import Mastermind
@testable import ViewInspector
import XCTest
import SwiftUI

final class GameScreenTests: XCTestCase {
    
    func test_displayCodeChoicesBottomUp() throws {
        try XCTSkipIf(true, "Disabled")
        let game = try Game(numberOfCodeChoices: 2)
        let sut = GameScreen(game: game)
        try sut.inspect().find(viewWithId: "codeChoices").vStack(0).forEach(0)
        XCTFail("continue here")
    }
    
    @MainActor func test_initialColorGuess_isUnselected() throws {
        let game = try Game(numberOfCodeChoices: 1)
        let sut = GameScreen(game: game)
        
        let color = try getColorOfGuess(try sut.inspect())
        
        XCTAssertEqual(color, Color.unselected)
    }
    
    
    @MainActor func test_tappingCodeChoiceSetsGuessColor() throws {
        let game = try Game(numberOfCodeChoices: 1)
        var sut = GameScreen(game: game)
        let codeChoice = game.codeChoices[0]
        var color: Color?
        
        inspectChangingView(&sut) { view in
            // Tap code choice button
            try view.find(viewWithId: codeChoice.codeValue)
                .button().tap()
            
            // Update the guess color
            color = try self.getColorOfGuess(view)
        }
        
        XCTAssertEqual(color, codeChoice.color)
    }
    
    private func getColorOfGuess<V: ViewInspector.KnownViewType>(
        _ view: InspectableView<V>
    ) throws -> Color? {
        try view.asInspectableView().find(viewWithId: "guess1")
            .button().labelView().shape().foregroundColor()
    }
    
} // GameScreenTests
