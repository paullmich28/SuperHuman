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
    var isExist: Bool
    
    init(icon: String = "", audio: String = "", duration: Int = 0, isExist: Bool = false) {
        self.icon = icon
        self.audio = audio
        self.duration = duration
        self.isExist = isExist
    }
}
