//
//  ContentView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("isWorking") var isWorking: Bool = false
    
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
}
