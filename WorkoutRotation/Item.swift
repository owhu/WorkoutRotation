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
    var dateAdded: Date
    var notes: String?

    init(title: String, isChecked: Bool = false, dateAdded: Date) {
        self.id = UUID()
        self.title = title
        self.isChecked = isChecked
        self.dateAdded = Date.now
    }
}
