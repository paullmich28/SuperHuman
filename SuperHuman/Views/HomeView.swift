//
//  HomeView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("productivityScale") var prodScale = 0.0
    
    var body: some View {
        
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            ProductivityScaleView(streak: prodScale)
        }
        .toolbar(content: {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                NavigationLink {
                    ListTaskView()
                } label: {
                    Image(systemName: "list.bullet")
                        .bold()
                        .foregroundStyle(.darkBlue)
                }
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                NavigationLink {
                    TrackRecordsView()
                } label: {
                    Image(systemName: "chart.bar.doc.horizontal")
                        .bold()
                        .foregroundStyle(.darkBlue)
                }
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                NavigationLink{
                    TrophyListView()
                } label: {
                    Image(systemName: "trophy")
                        .bold()
                        .foregroundStyle(.darkBlue)
                }
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                
                NavigationLink(
                    destination: NewTaskView()
                ) {
                    Image(systemName: "plus.circle.fill")
                        .bold()
                        .foregroundStyle(.darkBlue)
                }
            }
        })
        
    }
}

#Preview {
    HomeView()
}
