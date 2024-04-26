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
                            .stroke(.black.opacity(0.1), lineWidth: 20)
                        
                        let pct = Double(streak)/100.0
                        
                        Circle()
                            .trim(from: 0, to: pct)
                            .stroke(.darkBlue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
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
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                    NavigationLink {
                        TimerView()
                    } label: {
                        Image(systemName: "list.bullet")
                            .bold()
                            .foregroundStyle(.darkBlue)
                    }
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button(action: {
                        isShowingModal.toggle()
                    }) {
                        Image(systemName: "plus")
                            .bold()
                    }
                    .sheet(isPresented: $isShowingModal){
                        TimerView()
                    }
                    .foregroundStyle(Color.darkBlue)
                }
            })
        }
    }
}

#Preview {
    HomeView()
}
