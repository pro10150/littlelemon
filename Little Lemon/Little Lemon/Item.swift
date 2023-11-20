//
//  Item.swift
//  Little Lemon
//
//  Created by noppakun.a on 20/11/2566 BE.
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
