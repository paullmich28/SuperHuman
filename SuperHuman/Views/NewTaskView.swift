//
//  NewTaskView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 27/04/24.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                ForEach(1..<4) { _ in
                    NavigationLink {
                        TimerView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .frame(width: 192, height: 120)
                                .foregroundStyle(.white)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            
                            Image(systemName: "plus")
                                .foregroundStyle(.black.opacity(0.5))
                                .font(.largeTitle)
                        }
                        .padding([.vertical], 20)
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
    NavigationStack{
        NewTaskView()
    }
    
}
