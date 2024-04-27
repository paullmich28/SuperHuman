//
//  Tasks.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import Foundation
import SwiftData

@Model
class Tasks: Identifiable{
    var icon: String? = ""
    var audio: String? = ""
    var duration: Int? = 0
    
    init(icon: String? = nil, audio: String? = nil, duration: Int? = nil) {
        self.icon = icon
        self.audio = audio
        self.duration = duration
    }
}
