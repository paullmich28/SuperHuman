//
//  OngoingTimerView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 27/04/24.
//

import SwiftUI
import Lottie

struct OngoingTimerView: View {
    @Environment(\.dismiss) var dismiss

    @State var hour:Int=0
    @State var minute:Int=0
    @State var second:Int=10
    
    var emoji:String="😍"
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            VStack{
                VStack{
                    Text(emoji).foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                }.frame(width:120, height:75).background(.darkBlue).cornerRadius(10)
                
                Spacer()
                //AnimationView(name:"hourglass",loopMode:.loop, animationSpeed:10)
                CountDown(hour:$hour, minute:$minute, second:$second)
                
                Spacer()
                
                if(hour==0 && minute==0 && second==0){
                    DoneOrNot()
                }
                
                //AnimationView(name:"hourglass",loopMode:.loop,animationSpeed: 1)
                Spacer()
            }
            
            
            VStack{
                
            }
            
        }.navigationBarBackButtonHidden(true)
        .toolbar(content:{
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Menu()
                })
                .foregroundStyle(.darkBlue)
            }
        })
        

    }
}

struct DoneOrNot : View{
    var body : some View{
        HStack{
            Spacer()
            Button(action: {
                //dismiss()
            }, label: {
                VStack{
                    Image(systemName:"xmark").foregroundColor(Color.darkBlue).font(.custom("SF Pro",size:50))
                }.frame(width:120,height:75).background(Color.whiteBlue).cornerRadius(10)
            })
            
            Spacer()
            
            Button(action: {
                //dismiss()
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
    
    let timer = Timer.publish(every:1, on:.main, in:.common).autoconnect()

    var body : some View{
        HStack{
            if hour>9{
                Text("\(hour)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
            }
            else{
                Text("0\(hour)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
            }

            Text(" : ").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
            
            if minute>9{
                Text("\(minute)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))

            }
            else{
                Text("0\(minute)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
            }
            
            Text(" : ").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
            
            if second>9{
                Text("\(second)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))

            }
            else{
                Text("0\(second)").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
            }

        }
        .onReceive(timer){_ in 
            if(second==0){
                if(minute==0){
                    if(hour != 0){
                        hour = hour - 1
                        minute = 59
                        second = 59
                    }
                    else{
                        //NOO
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

#Preview {
    OngoingTimerView()
}
