//
//  ListTaskView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 27/04/24.
//

import SwiftUI
import SwiftData
import AVKit

struct ListTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedIndex: Int? = nil
    
    @Query var tasks: [Tasks]
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                if tasks.isEmpty{
                    AnimationView(name: "empty", loopMode: .loop, animationSpeed: 0.5)
                        .scaleEffect(0.9)
                }else{
                    ScrollView{
                        ForEach(0..<tasks.count, id: \.self){ index in
                            NavigationLink {
                                OngoingTimerView(index: index)
                            } label: {
                                TaskView(icon: tasks[index].icon, url: tasks[index].audio, durationHour: tasks[index].durationHour, durationMinute: tasks[index].durationMinute, durationSeconds: tasks[index].durationSecond, isCompleted: tasks[index].isCompleted)
                                    .padding()
                            }
                        }
                    }
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
    ListTaskView()
}
