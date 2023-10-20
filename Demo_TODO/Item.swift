//
//  Item.swift
//  Demo_TODO
//
//  Created by Matrix on 06/10/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date?
    var taskContent: String?
    
    init(timestamp: Date, taskContent: String) {
        self.timestamp = timestamp
        self.taskContent = taskContent
    }
}
