//
//  WardrobeItem.swift
//  My Own Wardrobe
//
//  Created by Toussaint Turnier on 6/27/24.
//

import Foundation
import UIKit

struct WardrobeItem: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var color: String
    var brand: String
    var size: String
    var image: UIImage? = nil
}

