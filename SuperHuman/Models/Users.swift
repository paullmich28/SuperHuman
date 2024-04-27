//
//  Users.swift
//  SuperHuman
//
//  Created by Paulus Michael on 26/04/24.
//

import Foundation
import SwiftData

@Model
class Users{
    var goldMedals: Int
    var silverMedals: Int
    var bronzeMedals: Int
    var trophies: Int
    var productivityScale: Int
    
    init(
        goldMedals: Int = 0,
        silverMedals: Int = 0,
        bronzeMedals: Int = 0,
        trophies: Int = 0,
        productivityScale: Int = 0
    ) {
        self.goldMedals = goldMedals
        self.silverMedals = silverMedals
        self.bronzeMedals = bronzeMedals
        self.trophies = trophies
        self.productivityScale = productivityScale
    }
}
