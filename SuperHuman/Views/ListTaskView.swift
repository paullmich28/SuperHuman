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
                        ForEach(tasks, id: \.self){ task in
                            TaskView(icon: task.icon, url: task.audio, durationHour: task.durationHour, durationMinute: task.durationMinute, durationSeconds: task.durationSecond)
                                .padding()
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
