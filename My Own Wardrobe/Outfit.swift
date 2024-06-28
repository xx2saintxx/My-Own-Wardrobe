//
//  Outfit.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import Foundation

struct Outfit: Identifiable {
    var id = UUID()
    var name: String
    var items: [String]
    var date: Date? // Add a date property for calendar planning
}

