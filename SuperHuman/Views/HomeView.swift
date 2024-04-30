//
//  HomeView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack{
            DefaultView()
        }
    }
}

struct DefaultView: View {
    var body: some View {
        let streak = 1
        
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            ProductivityScaleView(streak: Double(streak))
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
                NavigationLink {
                    NewTaskView()
                } label: {
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
