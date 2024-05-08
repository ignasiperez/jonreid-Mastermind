//
//  ContentView.swift
//  Mastermind
//
//  Created by Ignasi Perez-Valls on 7/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            let _ = print("Production launch")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}