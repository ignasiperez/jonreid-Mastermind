import SwiftUI


struct GameScreen: TestableView {
    @State private var game: Game
    @State private var guess1: CodeChoice?
    var viewInspectorHook: ((Self) -> Void)?
    
    init(game: Game) {
        self.game = game
    }
    
//    fileprivate func isGuessCorrect(_ guess: [CodeChoice]) -> Bool {
//        return game.isGuessCorrect(guess)
//    }
    
    var body: some View {
        Color.background.ignoresSafeArea().overlay {
            HStack {
                CodeGuessView(guess: $guess1)
                CodeChoicesView(game: $game, guess1: $guess1)
            }
        }  // Color
        .inspectableSheet(isPresented: .constant(guess1 != nil),
               content: {
            if (game.isGuessCorrect([guess1!])) {
                Text("You win!")
            } else {
                Text("You lose!")
            }
        })
        .onAppear { self.viewInspectorHook?(self) }
    }
} // GameScreen

private struct CodeGuessView: View {
    @Binding var guess: CodeChoice?
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Circle()
                .padding(10)
                .overlay {
                    Circle()
                        .strokeBorder(Color.unselected)
                }
                .foregroundColor(guess?.color ?? Color.unselected)
                .frame(width: 100, height: 100)
        })
        .id("guess1")
    }
}

private struct CodeChoicesView: View {
    @Binding var game: Game
    @Binding var guess1: CodeChoice?

    var body: some View {
        VStack {
            ForEach(game.codeChoices.reversed(), id: \.codeValue) { codeChoice in
                CodeChoiceView(codePeg: codeChoice, id: codeChoice.codeValue, guess: $guess1)
            }
        }
        .id("codeChoices")
    }
}

private struct CodeChoiceView: View {
    var codePeg: CodeChoice
    var id: Int
    @Binding var guess: CodeChoice?
    
    var body: some View {
        Button(action: {
            guess = codePeg
        }, label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 100, height: 100)
                .overlay {
                    Circle().foregroundColor(codePeg.color)
                        .padding(10)
                }
        })
        .id(id)
    } // body
    
} // CodeChoiceView

#Preview {
    GameScreen(game: try! Game(numberOfCodeChoices: 2))
}
