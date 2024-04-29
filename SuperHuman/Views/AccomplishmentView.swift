//
//  AccomplishmentView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 28/04/24.
//

import SwiftUI
import Lottie
import SwiftData

struct AccomplishmentView: View {
    @Query var tasks: [Tasks]
    @State private var showAnimation = true
    var isDone=false
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            if showAnimation {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
            }
            
            VStack{
                if isDone{
                    AnimationView(name: "happy", loopMode: .loop, animationSpeed: 1.0)
                        .scaleEffect(0.3)
                        .onAppear {
                            // Start the animation and darken the background for a few seconds
                            /*
                            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                                showAnimation = false
                            }
                             */
                        }
                }
                else{
                    AnimationView(name: "crying", loopMode: .loop, animationSpeed: 2.0)
                        .scaleEffect(0.8)
                        .onAppear {
                            // Start the animation and darken the background for a few seconds
                            /*
                            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                                showAnimation = false
                            }
                             */
                        }
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AccomplishmentView()
}
