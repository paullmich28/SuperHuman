//
//  ContentView.swift
//  SuperHuman
//
//  Created by Paulus Michael on 25/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @Query var tasks: [Tasks]
    @State var corrects: Int = 0
    
    var body: some View {
        NavigationStack {
            HomeView()
                .onAppear{
                    if check(){
                        do{
                            try context.delete(model: Tasks.self)
                        }catch{
                            print("Failed to delete tasks")
                        }
                        
                        UserDefaults.standard.set(0.0, forKey: "productivityScale")
                        UserDefaults.standard.set(0, forKey: "duration")
                    }
                }
        }
    }
    
    func check() -> Bool {
        if let referenceDate = UserDefaults.standard.object(forKey: "reference") as? Date {
            // reference date has been set, now check if date is not today
            if !Calendar.current.isDateInToday(referenceDate) {
                // if date is not today, do things
                // update the reference date to today
                UserDefaults.standard.set(Date(), forKey: "reference")
                return true
            }
        } else {
            // reference date has never been set, so set a reference date into UserDefaults
            UserDefaults.standard.set(Date(), forKey: "reference")
            return true
        }
        return false
    }
}

#Preview {
    ContentView()
}
