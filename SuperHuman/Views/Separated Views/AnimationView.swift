//
//  AnimationView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 28/04/24.
//

import SwiftUI
import Lottie

struct AnimationView: UIViewRepresentable{
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    
    func makeUIView(context: Context) -> Lottie.LottieAnimationView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
