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
    var duration: Int
    var timestamp: Date
    var isCompleted: Bool
    
    init(icon: String = "", audio: String = "", duration: Int = 0, timestamp: Date = Date.now, isCompleted: Bool = false) {
        self.icon = icon
        self.audio = audio
        self.duration = duration
        self.timestamp = timestamp
        self.isCompleted = isCompleted
    }
}
