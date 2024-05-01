//
//  HomeView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @AppStorage("productivityScale") var prodScale = 0.0
    @Environment(\.dismiss) var dismiss
    
    @State var corrects = 0
    @Query var tasks: [Tasks]
    
    var body: some View {
        
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            ProductivityScaleView(streak: prodScale)
        }
        .overlay(alignment: .center){
            
            MedalView()
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        dismiss()
                    }
                }
            
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
    
    func isCompleted3() -> Bool {
        corrects = 0
        
        tasks.forEach{task in
            if task.isCompleted{
                corrects += 1
            }
        }
        
        if corrects == 3{
            return true
        }else{
            return false
        }
    }
}

#Preview {
    HomeView()
}
