//
//  AudioRecordingView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI
import SwiftData
import AVKit

struct AudioRecordingView: View {
    @Environment(\.dismiss) var dismiss
    @State var session: AVAudioSession!
    @State var recorder: AVAudioRecorder!
    
    @State var record = false
    @State var offsetRecord = 0.0
    @State var circleSize: CGFloat = 0.0
    @State var isRecorded = false
    @State var audio = ""
    
    @Query var tasks: [Tasks]
    
    var body: some View {
        ZStack {
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                Spacer()
                
                HStack(spacing: 30){
                    if isRecorded{
                        ZStack{
                            Circle()
                                .fill(Color.darkBlue)
                                .frame(width: 60, height: 60)
                            
                            Circle()
                                .stroke(.lightBlue, lineWidth: 5)
                                .fill(.darkBlue)
                                .frame(width: 50, height: 50)
                            
                            Image(systemName: "play")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        .offset(y: -70)
                    }
                    
                    ZStack{
                        Circle()
                            .fill(Color.darkBlue)
                            .frame(width: 70, height: 70)
                        
                        Circle()
                            .stroke(.lightBlue, lineWidth: 5)
                            .fill(.darkBlue)
                            .frame(width: 60, height: 60)
                        
                        Image(systemName: "mic.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                    }
                    .offset(y: -70)
                    .onTapGesture {
                        onIncreaseCircle()
                    }
                    
                    if isRecorded{
                        NavigationLink {
                            TimerView()
                        } label: {
                            ZStack{
                                Circle()
                                    .fill(Color.darkBlue)
                                    .frame(width: 60, height: 60)
                                
                                Circle()
                                    .stroke(.lightBlue, lineWidth: 5)
                                    .fill(.darkBlue)
                                    .frame(width: 50, height: 50)
                                
                                Image(systemName: "restart")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24))
                            }
                            .offset(y: -70)
                        }
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height)
            
            ZStack{
                VStack{
                    Spacer()
                    
                    Circle()
                        .fill(Color.darkBlue)
                        .frame(width: circleSize, height: circleSize)
                        .offset(y: -70)
                }
                
                if circleSize > 0.0{
                    VStack{
                        Image(systemName: "mic.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 50))
                            .padding(.top, 140)
                        
                        Text("")
                        
                        Spacer()
                        
                        ZStack{
                            Circle()
                                .fill(Color.white)
                                .frame(width: 70, height: 70)
                            
                            Image(systemName: "stop.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 24))
                        }
                        .offset(y: -50)
                        .onTapGesture {
                            onDecreaseCircle()
                            isRecorded = true
                        }
                    }
                    .frame(height: UIScreen.main.bounds.height)
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
        .onAppear{
            do{
                self.session = AVAudioSession.sharedInstance()
                try self.session.setCategory(.playAndRecord)
                
//                self.session.requestRecordPermission{ (status) in
//                    if !status{
//                        self.alert.toggle()
//                    }
//                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func onIncreaseCircle(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
            withAnimation(.spring){
                circleSize += 250.0
                
                if circleSize >= 1200.0{
                    timer.invalidate()
                }
            }
        }
    }
    
    func onDecreaseCircle(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
            withAnimation(.spring){
                circleSize -= 250.0
                
                if circleSize <= 0.0{
                    timer.invalidate()
                }
            }
        }
    }
}

#Preview {
    AudioRecordingView()
}
