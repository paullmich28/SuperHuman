//
//  Tasks.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import Foundation
import SwiftData

@Model
class Tasks{
    var icon: String
    var audio: URL
    var durationHour: Int
    var durationMinute: Int
    var durationSecond: Int
    var isCompleted: Bool
    
    init(icon: String = "", audio: URL = URL(string: "")!, durationHour: Int = 0, durationMinute: Int = 0, durationSecond: Int = 0, isCompleted: Bool = false) {
        self.icon = icon
        self.audio = audio
        self.durationHour = durationHour
        self.durationMinute = durationMinute
        self.durationSecond = durationSecond
        self.isCompleted = isCompleted
    }
}
