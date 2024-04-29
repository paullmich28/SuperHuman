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
    var audio: String
    var durationHour: Int
    var durationMinute: Int
    var durationSecond: Int
    var timestamp: Date
    var isCompleted: Bool
    
    init(icon: String = "", audio: String = "", durationHour: Int = 0, durationMinute: Int = 0, durationSecond: Int = 0, timestamp: Date = Date.now, isCompleted: Bool = false) {
        self.icon = icon
        self.audio = audio
        self.durationHour = durationHour
        self.durationMinute = durationMinute
        self.durationSecond = durationSecond
        self.timestamp = timestamp
        self.isCompleted = isCompleted
    }
}
