//
//  TrophyListView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import SwiftUI
import SwiftData

struct TrophyListView: View {
    @Query var users: [Users]
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                Text("List Trophy")
            }
        }
    }
}

#Preview {
    TrophyListView()
}
