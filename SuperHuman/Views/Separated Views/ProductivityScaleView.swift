//
//  ProductivityScaleView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 30/04/24.
//

import SwiftUI

struct ProductivityScaleView: View {
    var streak: Double
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(.black.opacity(0.1), lineWidth: 40)
                
                let pct = streak/100.0
                
                Circle()
                    .trim(from: 0, to: pct)
                    .stroke(.darkBlue, style: StrokeStyle(lineWidth: 40, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                
                VStack{
                    Text("0%")
                        .font(.system(size: 70))
                        .bold()
                }
                .foregroundStyle(.black)
                .fontDesign(.rounded)
                
            }
            .padding(.horizontal, 50)
        }
    }
}

#Preview {
    ProductivityScaleView(streak: 1.0)
}
