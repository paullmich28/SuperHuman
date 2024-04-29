//
//  ListTaskView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import SwiftUI
import SwiftData

struct TrackRecordsView: View {
    @Environment(\.dismiss) var dismiss
    
    @Query var trackRecords: [TrackRecords]
    
    @ViewBuilder
    func isListDisplayed() -> some View {
        if trackRecords.count > 0 {
            ScrollView{
                ForEach(trackRecords, id: \.self){ record in
                    RecordView(date: record.date, hours: record.duration, prodScale: record.productivityScale)
                        .padding()
                }
            }
        }else{
            AnimationView(name: "empty", loopMode: .loop, animationSpeed: 0.5)
                .scaleEffect(0.9)
        }
    }
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                isListDisplayed()
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
    NavigationStack{
        TrackRecordsView()
    }
}
