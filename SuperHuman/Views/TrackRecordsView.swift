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
    
    @State var isExisted = false
    @Query var trackRecords: [TrackRecords]
    
    @ViewBuilder
    func isListDisplayed() -> some View {
        if trackRecords.count > 0 {
            Text("There are tasks")
        }else{
            Text("No Tasks")
                .font(.title2)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
        }
    }
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                isListDisplayed()
                
                Spacer()
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
