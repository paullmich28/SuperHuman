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
    @State var record = false
    @State var outerCircleSize = 100.0
    @State var innerCircleSize = 85.0
    @State var mainColor = Color.lightBlue
    @State var secondaryColor = Color.darkBlue
    
    @Query var tasks: [Tasks]
    
    var body: some View {
        ZStack {
            Color.lightBlue.ignoresSafeArea()
            
            VStack {
                Button(action: {
//                    if record{
//                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                            
//                            withAnimation(.spring()){
//                                outerCircleSize -= 250.0
////                                print("\(outerCircleSize)")
//                                
//                                if innerCircleSize <= 0.0{
//                                    timer.invalidate()
//                                }
//                            }
//                        }
//                    }else{
//                        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//                            
//                            withAnimation(.spring()){
//                                outerCircleSize += 250.0
////                                print("\(outerCircleSize)")
//                                
//                                if innerCircleSize >= 1200.0{
//                                    timer.invalidate()
//                                }
//                            }
//                        }
//                    }
                    
                    record.toggle()
                }, label: {
                    ZStack{
                        Circle()
                            .frame(width: outerCircleSize, height: outerCircleSize)
                            .foregroundStyle(.darkBlue)
                        
                        Circle()
                            .stroke(.lightBlue, lineWidth: 5)
                            .frame(width: innerCircleSize, height: innerCircleSize)
                            .foregroundStyle(.darkBlue)
                        
                        Image(systemName: "mic.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundStyle(.lightBlue)
                    }
                })
                
//                Button(action: {}, label: {
//                    ZStack{
//                        Circle()
//                            .frame(width: 100)
//                            .foregroundStyle(.white)
//                        
//                        Image(systemName: "stop.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 25)
//                            .foregroundStyle(.red)
//                    }
//                })
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
