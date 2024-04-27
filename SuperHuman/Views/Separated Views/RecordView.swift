//
//  RecordView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 27/04/24.
//

import SwiftUI

struct RecordView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Tanggal")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Spacer()
            }
            
            HStack{
                Text("Total Jam")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Spacer()
            }
        }
        .padding()
        .background(Color.darkBlue)
        .cornerRadius(10.0)
    }
}

#Preview {
    RecordView()
}
