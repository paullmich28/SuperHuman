//
//  TimerView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isWorking") var isWorking: Bool = false
    
    @State var hour:Int=0
    @State var minute:Int=0
    @State var second:Int=0
    var emoji:String="😍"
    
    var body: some View {
        ZStack{
            Color.lightBlue.ignoresSafeArea()
            
            
            VStack{
                VStack{
                    Text(emoji).foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                }.frame(width:120, height:75).background(.darkBlue).cornerRadius(10)
                
                Spacer()
                ChooseTime(hour:$hour, minute:$minute, second:$second)
                
                Spacer()
                Button(action:{
                    
                },label:{
                    VStack{
                        Image(systemName:"arrowshape.right.fill").foregroundColor(.darkBlue).font(.custom("SF Pro",size:50))
                        
                    }.frame(width:120, height:75).background(.whiteBlue).cornerRadius(10)
                })
                Spacer()
            }

        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
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

struct Menu : View{
    var body : some View{
        HStack{
            VStack{
                Rectangle().frame(width:28,height:4.67).cornerRadius(2)
                Spacer()
                Rectangle().frame(width:28,height:4.67).cornerRadius(2)
                Spacer()
                Rectangle().frame(width:28,height:4.67).cornerRadius(2)
                
            }.frame(width:28,height:28).padding(.leading,10)
        }
    }
}

struct ChooseTime:View{
    @Binding var hour:Int
    @Binding var minute:Int
    @Binding var second:Int
    
    var body : some View{
        HStack{
            VStack{
                IncreaseButton(parameter:$hour,border:22)
                if hour>9{
                    Text("\(hour)").foregroundColor(.darkBlue).font(.custom("SF Pro", size: 60)).fontWeight(.medium)
                }
                else{
                    Text("0\(hour)").foregroundColor(.darkBlue).font(.custom("SF Pro", size: 60)).fontWeight(.medium)
                }
                DecreaseButton(parameter:$hour, border:1)
            }
            
            Colon()
            
            VStack{
                IncreaseButton(parameter:$minute, border:58)
                if minute>9{
                    Text("\(minute)").foregroundColor(.darkBlue).font(.custom("SF Pro", size: 60)).fontWeight(.medium)
                }
                else{
                    Text("0\(minute)").foregroundColor(.darkBlue).font(.custom("SF Pro", size: 60)).fontWeight(.medium)
                }
                DecreaseButton(parameter:$minute, border:1)
            }
            
            Colon()
            
            VStack{
                IncreaseButton(parameter:$second, border:58)
                if second>9{
                    Text("\(second)").foregroundColor(.darkBlue).font(.custom("SF Pro", size: 60)).fontWeight(.medium)
                }
                else{
                    Text("0\(second)").foregroundColor(.darkBlue).font(.custom("SF Pro", size: 60)).fontWeight(.medium)
                }
                DecreaseButton(parameter:$second, border:1)
            }
            
        }
    }
}

struct Colon : View{
    var body : some View{
        VStack{
            Text("").frame(height:35)
            Text(":").foregroundColor(.darkBlue).font(.custom("SF Pro", size: 60)).fontWeight(.medium)
            Text("").frame(height:35)
        }
    }
}

struct IncreaseButton : View{
    @Binding var parameter:Int
    let border:Int
    
    var body : some View{
        Button{
            if(parameter<=border){
                parameter = parameter + 1
            }
        }label:{
            VStack{
                Image(systemName: "righttriangle.fill")
                    .foregroundColor(.whiteBlue)
                    .rotationEffect(.degrees(225))
                    .offset(x:0,y:3)
            }.frame(width:60,height:35)
                .background(.darkBlue)
                .cornerRadius(10)
        }
    }
}

struct DecreaseButton : View{
    @Binding var parameter:Int
    let border:Int
    
    var body : some View{
        Button{
            if(parameter>=border){
                parameter = parameter - 1
            }
        }label:{
            VStack{
                Image(systemName: "righttriangle.fill")
                    .foregroundColor(.whiteBlue)
                    .rotationEffect(.degrees(45))
                    .offset(x:0,y:-3)
            }.frame(width:60,height:35)
                .background(.darkBlue)
                .cornerRadius(10)
        }
    }
}

#Preview {
    NavigationStack{
        TimerView(emoji:"😊")
    }
}
