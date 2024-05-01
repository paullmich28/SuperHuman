//
//  NewTaskView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 27/04/24.
//

import SwiftUI
import SwiftData

struct NewTaskView: View {
    @Environment(\.dismiss) var dismiss
    @State var taskIndex: Int = 0
    
    @Query var tasks: [Tasks]
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                ForEach(tasks){task in
                    NavigationLink {
                        TaskDetailView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 192, height: 120)
                                .foregroundStyle(.white)
                                .opacity(0.6)
                            
                            Image("😳")
                                .foregroundStyle(.black.opacity(0.5))
                                .font(.largeTitle)
                        }
                        .padding([.vertical], 20)
                    }
                    .isDetailLink(false)
                }
                
                if(tasks.count < 3){
                    NavigationLink {
                        AudioRecordingView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 192, height: 120)
                                .foregroundStyle(.white)
                                .opacity(0.6)
                            
                            Image(systemName: "plus")
                                .foregroundStyle(.black.opacity(0.5))
                                .font(.largeTitle)
                        }
                        .padding([.vertical], 20)
                    }
                    .isDetailLink(false)
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
}

#Preview {
    NewTaskView()
}
