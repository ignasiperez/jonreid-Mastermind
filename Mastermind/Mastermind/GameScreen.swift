import SwiftUI

struct CodeChoice {
    let color: Color
    let codeValue: Int
}

let codeChoice1 = CodeChoice(color: .blue, codeValue: 1)
let codeChoices = [codeChoice1]

struct GameScreen: View {
    @State private var guess: CodeChoice?
    internal var viewInspectorHook: ((Self) -> Void)?
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            HStack {
                CodeGuessView(guess: $guess)
                ForEach(codeChoices, id: \.codeValue) { codeChoice in
                    CodeChoiceView(
                        codePeg: codeChoice1,
                        id: "color1",
                        guess: $guess
                    )
                }
            }
            .onAppear { self.viewInspectorHook?(self) }
        }
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

private struct CodeChoiceView: View {
    var codePeg: CodeChoice
    var id: String
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
    GameScreen()
}
