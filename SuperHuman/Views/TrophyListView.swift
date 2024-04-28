//
//  TrophyListView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import SwiftUI
import SwiftData

struct TrophyListView: View {
    @AppStorage("goldMedals") var goldMedals = 0
    @AppStorage("silverMedals") var silverMedals = 0
    @AppStorage("bronzeMedals") var bronzeMedals = 0
    @AppStorage("trophies") var trophies = 0
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                Text("\(goldMedals)")
            }
        }
    }
}

#Preview {
    TrophyListView()
}
