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
        
        sut.on(\.didAppear) { view in
            // Tap the circle
            try view.button().tap()
            
            // Update the `color` variable
            color = try view
                .button().labelView().shape().foregroundColor()
        }
        
        ViewHosting.host(view: sut)
        XCTAssertEqual(color, Color.orange)
    }
    
} // GameScreenTests
