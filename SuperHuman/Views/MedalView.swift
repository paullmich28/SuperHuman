//
//  MedalView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 29/04/24.
//

import SwiftUI

struct MedalView: View {
    @AppStorage("productivityScale") var prodScale = 0.0
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                ZStack {
                    Image("goldMedal")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 100)
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                    
                    AnimationView(name: "pop", loopMode: .loop, animationSpeed: 0.7)
                        .scaleEffect(2.5)
                        .frame(height: 100)
                }
                
                ProductivityScaleView(streak: prodScale)
                    .padding(75)
                
                HStack{
                    ForEach(1..<4){_ in
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 110, height: 85)
                                .foregroundStyle(.white)
                                .opacity(0.6)
                            
                            Image(systemName: "plus")
                                .foregroundStyle(.black.opacity(0.5))
                                .font(.largeTitle)
                        }
                        .padding([.vertical], 20)
                    }
                }
            }
            
            AnimationView(name: "hooray", loopMode: .playOnce, animationSpeed: 1.0)
                .scaleEffect(2)
        }
    }
}

#Preview {
    MedalView()
}
