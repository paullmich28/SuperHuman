//
//  ListTaskView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import SwiftUI
import SwiftData

struct ListTaskView: View {
    @State var isExisted = false
    @Query var tasks: [Tasks]
    
    @ViewBuilder
    func isListDisplayed() -> some View {
        if tasks.count > 0 {
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
    }
}

#Preview {
    ListTaskView()
}
