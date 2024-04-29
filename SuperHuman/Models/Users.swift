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
    var productivityScale: Int
    
    init(
        productivityScale: Int = 0
    ) {
        self.productivityScale = productivityScale
    }
}
