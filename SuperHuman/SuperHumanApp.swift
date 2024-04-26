//
//  SuperHumanApp.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI
import SwiftData

@main
struct SuperHumanApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Tasks.self,
                    TrackRecords.self,
                    Users.self
                ])
        }
    }
}
