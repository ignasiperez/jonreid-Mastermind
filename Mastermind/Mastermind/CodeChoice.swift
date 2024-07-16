//
//  CodeChoice.swift
//  Mastermind
//
//  Created by Ignasi Perez-Valls on 15/7/24.
//

import SwiftUI

struct CodeChoice: Equatable {
    let color: Color
    let codeValue: Int
}

struct CodeChoiceGenerator {
    static func generate(from colors: [Color], take: Int) throws -> [CodeChoice] {
        //  guard colors.count >= count else {
        //      throw CodeChoiceGeneratorError.notEnoughColors
        //  }
        //  return colors.prefix(count).enumerated().map { index, color in
        return [CodeChoice(color: .red, codeValue: 1)]
    }
}


let codeChoice1 = CodeChoice(color: .brown, codeValue: 1)
//  let codeChoice2 = CodeChoice(color: .black, codeValue: 2)
let codeChoices = [codeChoice1]



