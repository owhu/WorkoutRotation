//
//  WeeklyScheduleView.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 2/7/25.
//

//import SwiftUI
//import SwiftData
//
//struct WeeklyScheduleView: View {
//    let daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
//    let timeSlots = Array(6...22) // 6 AM to 10 PM
//    
//    var body: some View {
//        ScrollView([.horizontal, .vertical]) {
//            Grid(horizontalSpacing: 1, verticalSpacing: 1) {
//                // Header row
//                GridRow {
//                    Color.clear
//                        .frame(width: 50, height: 30)
//                    ForEach(daysOfWeek, id: \.self) { day in
//                        Text(day)
//                            .frame(width: 100)
//                            .background(Color.gray.opacity(0.2))
//                    }
//                }
//                
//                // Time slots
//                ForEach(timeSlots, id: \.self) { hour in
//                    GridRow {
//                        Text("\(hour):00")
//                            .frame(width: 50)
//                        
//                        ForEach(daysOfWeek, id: \.self) { day in
//                            TimeSlotView(day: day, hour: hour)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

//struct TimeSlotView: View {
//    let day: String
//    let hour: Int
//    @State private var assignedItem: Item?
//    
//    var body: some View {
//        Rectangle()
//            .fill(Color.gray.opacity(0.1))
//            .frame(width: 100, height: 60)
//            .dropDestination(for: Item.self) { items, location in
//                guard let item = items.first else { return false }
//                assignedItem = item
//                return true
//            }
//            .overlay {
//                if let item = assignedItem {
//                    Text(item.title)
//                        .foregroundStyle(.white)
//                }
//            }
//    }
//}


//#Preview {
//    WeeklyScheduleView()
//}
