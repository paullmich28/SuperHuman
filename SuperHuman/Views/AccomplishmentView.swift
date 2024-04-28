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
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                AnimationView(name: "crying", loopMode: .loop, animationSpeed: 1.0)
                    .frame(width: 100, height: 100)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AccomplishmentView()
}
