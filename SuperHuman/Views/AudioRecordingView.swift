//
//  AudioRecordingView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI

struct AudioRecordingView: View {
    var body: some View {
        ZStack {
            Color.lightBlue.ignoresSafeArea()
            
            VStack {
                Button(action: {}, label: {
                    Image("AudioRec")
                })
            }
            .padding()
        }
    }
}

#Preview {
    AudioRecordingView()
}
