//
//  RecordView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 27/04/24.
//

import SwiftUI
import SwiftData

struct RecordView: View {
    var date: Date
    var hours: Int
    var prodScale: Int
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "calendar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(.white)
                
                Text("\(dateFormatter.string(from: date))")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                
                Spacer()
            }
            .padding(.bottom, 20)

            HStack{
                Image(systemName: "clock.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(.white)
                
                Text("\(hours)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                
                Spacer()
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(.white)
                
                Text("\(prodScale)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
            }
        }
        .padding(20)
        .background(Color.darkBlue)
        .cornerRadius(10.0)
    }
}

#Preview {
    RecordView(date: Date.now, hours: 4, prodScale: 87)
}
