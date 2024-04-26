//
//  TimerView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                Text("Hello World")
            }
        }
    }
}

#Preview {
    TimerView()
}
