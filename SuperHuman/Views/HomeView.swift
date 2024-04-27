//
//  HomeView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingModal = false
    
    var body: some View {
        let streak = 1
        
        NavigationStack{
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
                    
//                    Button(action: {
//                        isShowingModal.toggle()
//                    }) {
//                        Image(systemName: "list.bullet")
//                            .bold()
//                    }
//                    .sheet(isPresented: $isShowingModal){
//                        TrackRecordsView()
//                    }
//                    .foregroundStyle(Color.darkBlue)
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                    NavigationLink{
                        ListTaskView()
                    } label: {
                        Image(systemName: "trophy.circle")
                            .bold()
                            .foregroundStyle(.darkBlue)
                    }
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    NavigationLink {
                        TimerView()
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                            .foregroundStyle(.darkBlue)
                    }
                }
            })
        }
    }
}

#Preview {
    HomeView()
}
