//
//  OngoingTimerView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 27/04/24.
//

import SwiftUI
import Lottie
import SwiftData

struct OngoingTimerView: View {
    @Environment(\.dismiss) var dismiss

//    @Binding var path: NavigationPath
    
    var index: Int
    
    @State var hour:Int=0
    @State var minute:Int=0
    @State var second:Int=10
    
    @State var isPlaying = false
    @State var isDone:Bool=false
    @State var isNotDone:Bool=false
    @State var scaleEffect:Double = 0.8
    @State var goHome:Bool = false
    @State var animMode: LottieLoopMode = .loop
    
    @Query var tasks: [Tasks]
    
    var emoji:String="😍"
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            VStack{
                VStack{
                    Text(emoji).foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                }.frame(width:120, height:75).background(.darkBlue).cornerRadius(10)
                
                Spacer()
  
                CountDown(hour:$hour, minute:$minute, second:$second, isPlaying: $isPlaying)
                
                Spacer()
                
                AnimationView(name:"hourglass",loopMode: animMode, animationSpeed:1).scaleEffect(0.8)
                    .frame(width:300,height:350)
                
                if isTimeOut(hour: hour, minute: minute, second: second){
                    Spacer()
                    DoneOrNot(isDone:$isDone, isNotDone:$isNotDone).onAppear{
                        scaleEffect=0.5
                    }
                }
                
                if !isPlaying{
                    Button(action: {
                        //dismiss()
                        isPlaying=true
                    }, label: {
                        VStack{
                            Image(systemName:"play.fill").foregroundColor(Color.whiteBlue).font(.custom("SF Pro",size:50))
                        }.frame(width:120,height:75).background(Color.darkBlue).cornerRadius(10)
                    })
                    .padding()
                }
                
                Spacer()
            }

        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: { ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .bold()
                })
                .foregroundStyle(.darkBlue)
            }
        })
        .overlay(alignment:.center){
            if(isDone){
                AccomplishmentView(isDone:true).onAppear{
                    tasks[index].isCompleted = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isDone = false
                            goHome = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        NavigationUtil.popToRootView(animated: true)
                    }
                }
                
            }
            if(isNotDone){
                AccomplishmentView(isDone:false).onAppear{
                    tasks[index].isCompleted = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isDone = false
                            goHome = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        NavigationUtil.popToRootView(animated: true)
                    }
                }
            }
      
        }
        
    }
    
    func isTimeOut(hour: Int, minute: Int, second: Int) -> Bool{
        if(hour==0 && minute==0 && second==0){
            self.animMode = .playOnce
            return true
        }else{
            return false
        }
    }
}

struct DoneOrNot : View{
    
    @Binding var isDone:Bool
    @Binding var isNotDone:Bool
    
    var body : some View{
        HStack{
            Spacer()
            Button(action: {
                //dismiss()

                isNotDone=true
            }, label: {
                VStack{
                    Image(systemName:"xmark").foregroundColor(Color.darkBlue).font(.custom("SF Pro",size:50))
                }.frame(width:120,height:75).background(Color.whiteBlue).cornerRadius(10)
            })
            
            Spacer()
            
            Button(action: {
                //dismiss()
                isDone=true
            }, label: {
                VStack{
                    Image(systemName:"checkmark").foregroundColor(Color.whiteBlue).font(.custom("SF Pro",size:50))
                }.frame(width:120,height:75).background(Color.darkBlue).cornerRadius(10)
            })
            Spacer()
        }
    }
}

struct CountDown:View{
    @Binding var hour:Int
    @Binding var minute:Int
    @Binding var second:Int
    @Binding var isPlaying: Bool
    
    let timer = Timer.publish(every:1, on:.main, in:.common).autoconnect()

    var body : some View{
        HStack{
            if hour>9{
                Text("\(hour)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                    .fontDesign(.rounded)
            }
            else{
                Text("0\(hour)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                    .fontDesign(.rounded)
            }

            Text(" : ").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                .fontDesign(.rounded)
            
            if minute>9{
                Text("\(minute)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                    .fontDesign(.rounded)

            }
            else{
                Text("0\(minute)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                    .fontDesign(.rounded)
            }
            
            Text(" : ").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                .fontDesign(.rounded)
            
            if second>9{
                Text("\(second)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                    .fontDesign(.rounded)

            }
            else{
                Text("0\(second)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                    .fontDesign(.rounded)
            }

        }
        .onReceive(timer){_ in
            if isPlaying{
                if(second==0){
                    if(minute==0){
                        if(hour != 0){
                            hour = hour - 1
                            minute = 59
                            second = 59
                        }
                    }
                    else{
                        minute = minute - 1
                        second=59
                    }
                }
                else{
                    second = second - 1

                }
            }
        }
    }
}

//#Preview {
//    NavigationStack{
//        OngoingTimerView()
//
//    }
//}
