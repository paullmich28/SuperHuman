//
//  UserContainer.swift
//  SuperHuman
//
//  Created by Paulus Michael on 28/04/24.
//

import Foundation
import SwiftData

actor UserContainer{
    
    @MainActor
    static func create(shouldCreateDefaults: inout Bool) -> ModelContainer{
        let schema = Schema([Users.self])
        le config = ModelConfiguration()
        let container = try! ModelContainer(for: schema, config)
        
    }
}
