//
//  Test.swift
//  SuperHuman
//
//  Created by Paulus Michael on 30/04/24.
//

import SwiftUI

struct Test: View {
    var body: some View {
        let pct = 50/100.0
        
        ZStack{
            Color.black.ignoresSafeArea()
            
            Capsule()
                .frame(width: 50, height: 350)
                .foregroundStyle(Color.white)
            
            Capsule()
                .frame(width: 30, height: 330)
                .foregroundStyle(Color.black.opacity(0.3))
            
            Capsule()
            .trim(from: 0, to: pct)
                .frame(width: 30, height: 330)
                .foregroundStyle(Color.green)
        }
    }
}

#Preview {
    Test()
}
