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
    var tasks: [Tasks]
    
    init(duration: Int = 0, streaks: Int = 0, tasks: [Tasks] = [Tasks(icon: "", audio: "", duration: 0)]) {
        self.duration = duration
        self.streaks = streaks
        self.tasks = tasks
    }
}
