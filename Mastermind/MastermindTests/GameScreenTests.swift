@testable import Mastermind
@testable import ViewInspector
import XCTest
import SwiftUI

final class GameScreenTests: XCTestCase {
    
    func test_tappingColor1_SetsGuessColor() throws {
        // Get the game screen
        var sut = GameScreen()
        var color = try getColorOfGuess(try sut.inspect())
        XCTAssertNotEqual(color, Color.blue, "Precondition")
        
        display(&sut) { view in
            // Tap color1 button
            try view.find(viewWithId: "color1").button().tap()
            
            // Update the `color` variable
            color = try self.getColorOfGuess(view)
        }
        
        XCTAssertEqual(color, Color.brown)
    }
    
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
    
} // GameScreenTests
