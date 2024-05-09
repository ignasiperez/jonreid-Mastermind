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
    
    func test_tappingCircle_turnsItOrange() throws {
        var sut = GameScreen()
        var color = try sut.inspect()
            .button().labelView().shape().foregroundColor()
        XCTAssertNotEqual(color, Color.orange, "Precondition")
        
        let expectation = sut.on(\.viewInspectorHook) { view in
            // Tap the circle
            try view.button().tap()
            
            // Update the `color` variable
            color = try view
                .button().labelView().shape().foregroundColor()
        }
        
        ViewHosting.host(view: sut)
        wait(for: [expectation], timeout: 0.1)
        XCTAssertEqual(color, Color.orange)
    }
    
} // GameScreenTests
