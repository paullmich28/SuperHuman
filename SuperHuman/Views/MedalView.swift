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
                ZStack {
                    Image("goldMedal")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 100)
                    
                    AnimationView(name: "pop", loopMode: .loop, animationSpeed: 0.9)
                        .scaleEffect(2.5)
                        .frame(height: 100)
                }
                
                ProductivityScaleView(streak: 1.0)
                    .padding(75)
            }
            
            AnimationView(name: "hooray", loopMode: .playOnce, animationSpeed: 1.0)
                .scaleEffect(2)
        }
    }
}

#Preview {
    MedalView()
}
