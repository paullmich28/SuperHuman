//
//  TrackRecords.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import Foundation
import SwiftData

@Model
class TrackRecords{
    var duration: Int
    var streaks: Int
    var date: Date
    
    init(duration: Int = 0, streaks: Int = 0, date: Date = .now) {
        self.duration = duration
        self.streaks = streaks
        self.date = date
    }
}
