//
//  Item.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 9/3/24.
//

import Foundation

import SwiftUI
import SwiftData

@Model
class Item: Identifiable {
    let id: UUID
    var title: String
    var isChecked: Bool
    var type: String
    var dateAdded: Date

    init(title: String, isChecked: Bool = false, type: String, dateAdded: Date) {
        self.id = UUID()
        self.title = title
        self.isChecked = isChecked
        self.type = type
        self.dateAdded = Date.now
    }
}
