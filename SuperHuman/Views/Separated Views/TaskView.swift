//
//  TaskView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 30/04/24.
//

import SwiftUI
import SwiftData
import AVKit

struct TaskView: View {
    @State var color = Color.darkBlue
    @State var audioPlayer : AVAudioPlayer!
    
    var icon: String
    var url: URL
    var durationHour: Int
    var durationMinute: Int
    var durationSeconds: Int
    var isCompleted: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("\(icon)")
                    .font(.largeTitle)
                
                Spacer()
                
                Image(systemName: "clock.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(.white)
                
                Text("\(timeToString(time:durationHour)):\(timeToString(time:durationMinute)):\(timeToString(time:durationSeconds))")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
            }
            
            HStack{
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(.white)
                    .onTapGesture {
                        print(url)
                        startPlaying(url: url)
                    }
            }
        }
        .padding(20)
        .background(isCompleted ? .green : .darkBlue)
        .cornerRadius(10.0)
        .shadow(color: .black.opacity(0.25), radius: 5, x: 4, y: 4)
    }
    
    func timeToString(time: Int) -> String{
        var timeString: String = ""
        
        if time < 10{
            timeString = "0\(time)"
        }else{
            timeString = "\(time)"
        }
        
        return timeString
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
}

//#Preview {
//    TaskView(icon: "😬", url: URL(string("")), durationHour: 1, durationMinute: 30durationSeconds: 0)
//}
