//
//  TrackRecords.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import Foundation
import SwiftData

@Model
class TrackRecords: Identifiable{
    var duration: Int? = 0
    var streaks: Int? = 0
    var tasks: [Tasks]? = [Tasks(icon: "", audio: "", duration: 0)]
    
    init(duration: Int? = nil, streaks: Int? = nil, tasks: [Tasks]) {
        self.duration = duration
        self.streaks = streaks
        self.tasks = tasks
    }
}
