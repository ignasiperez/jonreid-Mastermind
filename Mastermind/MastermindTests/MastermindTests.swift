//
//  MastermindTests.swift
//  MastermindTests
//
//  Created by Ignasi Perez-Valls on 7/5/24.
//

@testable import Mastermind
import XCTest
import ViewInspector
import SwiftUI

// @MainActor
final class MastermindTests: XCTestCase {

    func test_circle_shouldBeRed() throws {
        // Make ContentView
        let view = GameScreen()
        
        // Find Circle
        let color = try view.inspect().shape().foregroundColor()
        
        // Test that fill color is red
        XCTAssertEqual(color, Color.red)
    }

}
