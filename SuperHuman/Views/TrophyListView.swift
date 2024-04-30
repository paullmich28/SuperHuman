//
//  TrophyListView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import SwiftUI
import SwiftData

struct TrophyListView: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("goldMedals") var goldMedals = 0
    @AppStorage("silverMedals") var silverMedals = 0
    @AppStorage("bronzeMedals") var bronzeMedals = 0
    @AppStorage("trophies") var trophies = 0
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                if trophies >= 1{
                    Image("piala")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 135)
                        .padding([.bottom], -15)
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                }else{
                    Image("piala-kosong")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 135)
                        .padding([.bottom], -15)
                }
                
                Image("meja")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                
                HStack{
                    ZStack {
                        Image("goldMedal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                        
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
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
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                        
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
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
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                        
                        Image("frame")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                    }
                    
                    Text("X\(bronzeMedals)")
                        .font(.largeTitle)
                        .foregroundStyle(.darkBlue)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    HStack{
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .bold()
                    }
                })
                .foregroundStyle(.darkBlue)
            }
        })
    }
}

#Preview {
    TrophyListView()
}
