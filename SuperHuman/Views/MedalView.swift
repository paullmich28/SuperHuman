//
//  MedalView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 29/04/24.
//

import SwiftUI

struct MedalView: View {
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                AnimationView(name: "hooray", loopMode: .playOnce, animationSpeed: 1.0)
                    .scaleEffect(2)
            }
        }
    }
}

#Preview {
    MedalView()
}
