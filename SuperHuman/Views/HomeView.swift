//
//  HomeView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isWorking") var isWorking: Bool = false
    
    var body: some View {
        NavigationStack{
            if isWorking{
                WorkingView()
            }else{
                DefaultView()
            }
        }
    }
}

struct DefaultView: View {
    var body: some View {
        let streak = 1
        
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            VStack{
                ZStack{
                    Circle()
                        .stroke(.black.opacity(0.1), lineWidth: 40)
                    
                    let pct = Double(streak)/100.0
                    
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
        .toolbar(content: {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                NavigationLink {
                    TrackRecordsView()
                } label: {
                    Image(systemName: "list.bullet")
                        .bold()
                        .foregroundStyle(.darkBlue)
                }
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                NavigationLink{
                    TrophyListView()
                } label: {
                    Image(systemName: "trophy.circle")
                        .bold()
                        .foregroundStyle(.darkBlue)
                }
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                NavigationLink {
                    NewTaskView()
                } label: {
                    Image(systemName: "plus")
                        .bold()
                        .foregroundStyle(.darkBlue)
                }
            }
        })
    }
}

struct WorkingView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isWorking") var isWorking: Bool = false
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                Text("00:00:00")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                
                Button("Click Me"){
                    isWorking.toggle()
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
    HomeView()
}
