//
//  GameScreenTests.swift
//  GameScreenTests
//
//  Created by Ignasi Perez-Valls on 7/5/24.
//

@testable import Mastermind
import XCTest
import ViewInspector
import SwiftUI

// @MainActor
final class GameScreenTests: XCTestCase {
    
    private func display(
        _ sut: inout GameScreen,
        using: @escaping ((InspectableView<ViewType.View<GameScreen>>) throws -> Void)
    ) {
        let expectation = sut.on(\.viewInspectorHook, perform: using)
        ViewHosting.host(view: sut)
        wait(for: [expectation], timeout: 0.1)
    }
    
    private func getColorOfGuess(
        _ view: InspectableView<ViewType.View<GameScreen>>
    ) throws -> Color? {
        return try view.button().labelView().shape().foregroundColor()
    }
    
    func test_tappingCircle_turnsItOrange() throws {
        var sut = GameScreen()
        var color = try sut.inspect()
            .button().labelView().shape().foregroundColor()
        XCTAssertNotEqual(color, Color.orange, "Precondition")
        
        display(&sut) { view in
            // Tap the circle
            try view.button().tap()
            
            // Update the `color` variable
            color = try self.getColorOfGuess(view)
        }
        
        XCTAssertEqual(color, Color.orange)
    }
    
} // GameScreenTests
