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
    @State var audioPlayer : AVAudioPlayer!
    
    @State var alert = false
    
    @State var txt = ""
    @State var show = false
    
    @State var record = false
    @State var offsetRecord = 0.0
    @State var circleSize: CGFloat = 0.0
    @State var isRecorded = false
    @State var audio: URL? = nil
    @State var icon = ""
    
    @State var audios: [URL] = []
    
    @Query var tasks: [Tasks]
    
    var body: some View {
        ZStack {
            Color.lightBlue.ignoresSafeArea()
            
            VStack{
                //                ZStack{
                //                    TextFieldWrapperView(text: $icon)
                //                        .background(Color.white.opacity(0.5))
                //                        .cornerRadius(20.0)
                //                        .offset(y: 100)
                //                        .frame(width: 192, height: 120)
                //
                //                    Image(systemName: "plus")
                //                        .foregroundStyle(.black.opacity(0.5))
                //                        .font(.largeTitle)
                //                        .offset(y: 100)
                //                }
                
                Spacer()
                
                HStack(spacing: 30){
                    if isRecorded{
                        ZStack{
                            Circle()
                                .fill(Color.darkBlue)
                                .frame(width: 70, height: 70)
                            
                            Circle()
                                .stroke(.lightBlue, lineWidth: 5)
                                .fill(.darkBlue)
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "play")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        .offset(y: -90)
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                        .onTapGesture {
                            startPlaying(url: audios.reversed()[tasks.count])
                            print(audios.reversed()[tasks.count])
                        }
                    }else{
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
                        .offset(y: -90)
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                        .onTapGesture {
                            onIncreaseCircle()
                            
                            writeData()
                        }
                    }
                    
                    if isRecorded{
                        ZStack{
                            Circle()
                                .fill(Color.darkBlue)
                                .frame(width: 70, height: 70)
                            
                            Circle()
                                .stroke(.lightBlue, lineWidth: 5)
                                .fill(.darkBlue)
                                .frame(width: 60, height: 60)
                            
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        .offset(y: -90)
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
                        .onTapGesture {
                            onIncreaseCircle()
                            
                            writeData()
                        }
                    }
                }
                .padding(.vertical)
                
                if isRecorded{
                    NavigationLink {
                        TimerView(url: audios.reversed()[tasks.count])
                    } label: {
                        VStack{
                            Image(systemName:"arrowshape.right.fill").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                            
                        }
                        .frame(width:120, height:75)
                        .background(.whiteBlue)
                        .cornerRadius(10)
                    }
                    .offset(y: -80)
                    
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
                        .offset(y: -90)
                        .onTapGesture {
                            onDecreaseCircle()
                            if self.record{
                                self.recorder.stop()
                                self.record.toggle()
                                self.getAudios()
                            }
                            
                            isRecorded = true
                            self.record = false
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
        .alert(isPresented: self.$alert, content: {
            Alert(title: Text("Error"), message: Text("Enable Access"))
        })
        .onAppear{
            do{
                self.session = AVAudioSession.sharedInstance()
                try self.session.setCategory(.playAndRecord)
                
                self.session.requestRecordPermission{ (status) in
                    if !status{
                        self.alert.toggle()
                    }else{
                        self.getAudios()
                    }
                }
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
    
    func getAudios(){
        do{
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let result = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
            
            self.audios.removeAll()
            
            for i in result{
                self.audios.append(i)
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func writeData(){
        do{
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let fileName = url.appendingPathComponent("myRcd\(tasks.count + 1).m4a")
            
            
            if FileManager.default.fileExists(atPath: fileName.path) {
                // Remove the existing file
                try FileManager.default.removeItem(at: fileName)
            }
            
            let settings = [
                AVFormatIDKey : Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey : 12000,
                AVNumberOfChannelsKey : 1,
                AVEncoderAudioQualityKey : AVAudioQuality.high.rawValue
            ]
            
            self.recorder = try AVAudioRecorder(url: fileName, settings: settings)
            self.recorder.record()
            self.record = true
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func startPlaying(url : URL) {
        
        let playSession = AVAudioSession.sharedInstance()
        
        do {
            try playSession.overrideOutputAudioPort(AVAudioSession.PortOverride.speaker)
        } catch {
            print("Playing failed in Device")
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf : url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            //            for i in 0..<recordingsList.count{
            //                if recordingsList[i].fileURL == url{
            //                    recordingsList[i].isPlaying = true
            //                }
            //            }
            
        } catch {
            print("Playing Failed")
        }
    }
    
    func stopPlaying(){
        audioPlayer.stop()
    }
}

#Preview {
    AudioRecordingView()
}
