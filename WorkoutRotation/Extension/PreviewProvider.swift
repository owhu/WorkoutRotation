//
//  PreviewProvider.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 9/6/24.
//

import Foundation

struct DeveloperPreview {
    
    static var item = Item(title: "Test", isChecked: false, dateAdded: Date.now)
    
    static var items: [Item] = [
        Item(title: "Test", isChecked: false, dateAdded: Date.now),
        Item(title: "Test1", isChecked: false, dateAdded: Date.now),
        Item(title: "Test2", isChecked: false, dateAdded: Date.now)
        
    ]
}
