//
//  AudioRecordingView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI
import SwiftData

struct AudioRecordingView: View {
    @Environment(\.dismiss) var dismiss
    
    @Query var tasks: [Tasks]
    
    var body: some View {
        ZStack {
            Color.lightBlue.ignoresSafeArea()
            
            VStack {
                Button(action: {}, label: {
                    Image("AudioRec")
                })
            }
            .padding()
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
    AudioRecordingView()
}
