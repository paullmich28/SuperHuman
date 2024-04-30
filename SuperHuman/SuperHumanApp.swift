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
    @AppStorage("goldMedals") var goldMedals = 0
    @AppStorage("silverMedals") var silverMedals = 0
    @AppStorage("bronzeMedals") var bronzeMedals = 0
    @AppStorage("trophies") var trophies = 0
    @AppStorage("productivityScale") var prodScale = 0.0
    @AppStorage("duration") var duration = 0
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Tasks.self,
                    TrackRecords.self
                ])
        }
    }
}
