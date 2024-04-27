//
//  Users.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import Foundation
import SwiftData

@Model
class Users: Identifiable{
    var id: String? = UUID().uuidString
    var goldMedals: Int? = 0
    var silverMedals: Int? = 0
    var bronzeMedals: Int? = 0
    var trophies: Int? = 0
    var productivityScale: Int? = 0
    
    init(
        id: String? = UUID().uuidString,
        goldMedals: Int? = nil,
        silverMedals: Int? = nil,
        bronzeMedals: Int? = nil,
        trophies: Int? = nil,
        productivityScale: Int? = nil
    ) {
        self.id = id
        self.goldMedals = goldMedals
        self.silverMedals = silverMedals
        self.bronzeMedals = bronzeMedals
        self.trophies = trophies
        self.productivityScale = productivityScale
    }
}
