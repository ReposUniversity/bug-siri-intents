//
//  ContentView.swift
//  bug-siri-intents
//
//  Created by Matheus Gois on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStorage: DataStorage

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(dataStorage.selected)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
