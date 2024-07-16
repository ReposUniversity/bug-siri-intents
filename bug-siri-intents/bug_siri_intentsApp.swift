//
//  bug_siri_intentsApp.swift
//  bug-siri-intents
//
//  Created by Matheus Gois on 16/07/24.
//

import SwiftUI

@main
struct bug_siri_intentsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStorage.shared)
        }
    }
}
