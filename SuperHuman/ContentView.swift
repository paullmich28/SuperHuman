//
//  ContentView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.lightBlue.ignoresSafeArea()
            
            VStack {
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
