//
//  ViewModel.swift
//  SuperHuman
//
//  Created by Paulus Michael on 30/04/24.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject{
    @Published var path: NavigationPath = NavigationPath()
}
