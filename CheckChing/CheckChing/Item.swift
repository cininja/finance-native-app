//
//  Item.swift
//  CheckChing
//
//  Created by Cindy Nguyen on 23.12.25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
