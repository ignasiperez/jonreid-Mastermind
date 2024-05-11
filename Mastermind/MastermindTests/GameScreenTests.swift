@testable import Mastermind
@testable import ViewInspector
import XCTest
import SwiftUI

// @MainActor
final class GameScreenTests: XCTestCase {
    
    private func display(
        _ sut: inout GameScreen,
        using: @escaping ((InspectableView<ViewType.View<GameScreen>>) throws -> Void),
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let expectation = sut.on(\.viewInspectorHook,
                                  file: file,
                                  line: line,
                                  perform: using)
        ViewHosting.host(view: sut)
        wait(for: [expectation], timeout: 0.01)
    }
    
    private func getColorOfGuess<V: ViewInspector.KnownViewType>(
        _ view: InspectableView<V>
    ) throws -> Color? {
        try view.asInspectableView()
            .find(viewWithId: "guess1").button().labelView().shape().foregroundColor()
    }
    
    func test_tappingCircle_turnsItOrange() throws {
        // Get the game screen
        var sut = GameScreen()
        var color = try getColorOfGuess(try sut.inspect())
        XCTAssertNotEqual(color, Color.orange, "Precondition")
        
        display(&sut) { view in
            // Tap the circle
            try view.find(viewWithId: "guess1").button().tap()
            
            // Update the `color` variable
            color = try self.getColorOfGuess(view)
        }
        
        XCTAssertEqual(color, Color.orange)
    }
    
} // GameScreenTests
