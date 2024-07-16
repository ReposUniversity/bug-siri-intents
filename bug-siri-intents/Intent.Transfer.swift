//
//  Intent.Transfer.swift
//  bug-siri-intents
//
//  Created by Matheus Gois on 16/07/24.
//

import SwiftUI
import AppIntents

struct Intents {
    @available(iOS 16, *)
    struct ShortcutsProvider: AppShortcutsProvider {

        static var appShortcuts: [AppShortcut] {
            AppShortcut(
                intent: ContactsIntent(),
                phrases: [
                    "Contato com \(.applicationName)"
                ],
                shortTitle: LocalizedStringResource("Falar")
            )
        }
    }
}

@available(iOS 16, *)

struct ContactsIntent: AppIntent {

    static var title: LocalizedStringResource = "Select contact"

    static var openAppWhenRun = true

    static var authenticationPolicy: IntentAuthenticationPolicy = .requiresAuthentication

    @Parameter(
        title: "Contacts",
        description: "Send to contacts",
        requestValueDialog: IntentDialog("Who is the contact?"),
        optionsProvider: ContactsectionsOptionsProvider()
    )
    var contact: String


    private struct ContactsectionsOptionsProvider: DynamicOptionsProvider {
        func results() async throws -> ItemCollection<String> {
            return ItemCollection {
                ItemSection(
                    items: DataStorage.contacts.map {
                        let name = $0.capitalized(with: .autoupdatingCurrent)
                        return IntentItem<String>.init(
                            name,
                            title: LocalizedStringResource(stringLiteral: name)
                        )
                    }
                )
            }
        }
    }

    @MainActor
    func perform() async throws -> some IntentResult {

        // This never is called
        DataStorage.shared.selected = contact


        return .result()
    }
}

class DataStorage: ObservableObject {

    static let shared = DataStorage()

    @Published var selected: String = ""
    // Communs names in Brazil
    static var contacts: [String] {
        [
            "Adriano", // Not Works in device
            "Ricardo", // Not Works in device
            "Bruno", // Not Works in device
            "Serapião" // Works
        ]
    }
}
