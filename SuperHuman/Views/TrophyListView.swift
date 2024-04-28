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
                Image("piala")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 135)
                    .padding([.bottom], -15)
                
                Image("meja")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                HStack{
                    ZStack {
                        Image("goldMedal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    
                    Text("X\(goldMedals)")
                        .font(.largeTitle)
                        .foregroundStyle(.darkBlue)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                }
                
                HStack{
                    ZStack{
                        Image("silverMedal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    
                    Text("X\(silverMedals)")
                        .font(.largeTitle)
                        .foregroundStyle(.darkBlue)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                }
                
                HStack{
                    ZStack {
                        Image("bronzeMedal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                        
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    }
                    
                    Text("X\(bronzeMedals)")
                        .font(.largeTitle)
                        .foregroundStyle(.darkBlue)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                }
            }
        }
    }
}

#Preview {
    TrophyListView()
}
