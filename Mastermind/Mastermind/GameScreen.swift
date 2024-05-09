//
//  GameScreen.swift
//  Mastermind
//
//  Created by Ignasi Perez-Valls on 7/5/24.
//

import SwiftUI

struct GameScreen: View {
    @State private var buttonColor = Color.red
    internal var didAppear: ((Self) -> Void)?
    
    var body: some View {
        Button(action: {
            buttonColor = .orange
        }, label: {
            Circle().foregroundColor(buttonColor)
        })
        .onAppear { self.didAppear?(self) }
    }
}

#Preview {
    GameScreen()
}
