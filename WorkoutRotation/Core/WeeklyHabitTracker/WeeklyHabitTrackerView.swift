//
//  WeeklyHabitTrackerView.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 2/24/25.
//

import SwiftUI

struct WeeklyHabitTrackerView: View {
    let days = ["S", "M", "T", "W", "T", "F", "S"]
    @AppStorage private var habitData: String
    private var habitArray: [Character] { Array(habitData) }
    let item: Item
    
    init(item: Item) {
        self.item = item
        // Create a unique key for each item's habit tracking data
        let storageKey = "habitTracker_\(item.id)"
        // Initialize AppStorage with the unique key and default value
        _habitData = AppStorage(wrappedValue: "0000000", storageKey)
    }

    var body: some View {
        HStack(spacing: 15) {
            ForEach(days.indices, id: \.self) { index in
                VStack {
                Button{
                    toggleCheckmark(at: index)
                } label: {
//                    Text(days[index])
                    Circle()
                        .scaledToFit()
//                        .frame(width: 40, height: 40)
//                        .background(habitArray[index] == "1" ? Color.green : Color.gray.opacity(0.2))
                        .foregroundColor(habitArray[index] == "1" ? Color.green : Color.gray.opacity(0.2))
//                        .clipShape(Circle())
//                        .overlay(
//                            Image(systemName: habitArray[index] == "1" ? "checkmark" : "")
//                                .foregroundColor(.white)
//                        )
                }
                Text(days[index])
                        .font(.caption2)
                }
            }
        }
        .padding()
    }

    private func toggleCheckmark(at index: Int) {
        var habitArray = Array(habitData) // Convert String to an Array of Characters
        habitArray[index] = habitArray[index] == "0" ? "1" : "0" // Toggle the value
        habitData = String(habitArray) // Convert back to a String
    }

}

#Preview {
    WeeklyHabitTrackerView(item: DeveloperPreview.item)
}
