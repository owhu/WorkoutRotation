//
//  Detail-ViewModel.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 9/13/24.
//

import Foundation

//extension DetailView {
//    final class ViewModel: ObservableObject {
//        @Published var isActive = false
//        @Published var showingAlert = false
//        @Published var time: String = "1:00"
//        @Published var minutes: Float = 1.0 {
//            didSet {
//                self.time = "\(Int(minutes)):00"
//            }
//        }
//        var initialTime = 1
//        private var endDate = Date()
//        
//        // Start the timer with the given amount of minutes
//        func start(minutes: Float) {
//            self.initialTime = Int(minutes)
//            self.endDate = Date()
//            self.isActive = true
//            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
//        }
//        
//        // Reset the timer
//        func reset() {
//            self.minutes = Float(initialTime)
//            self.isActive = false
//            self.time = "\(Int(minutes)):00"
//        }
//        
//        // Show updates of the timer
//        func updateCountdown(){
//            guard isActive else { return }
//            
//            // Gets the current date and makes the time difference calculation
//            let now = Date()
//            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
//            
//            // Checks that the countdown is not <= 0
//            if diff <= 0 {
//                self.isActive = false
//                self.time = "0:00"
//                self.showingAlert = true
//                return
//            }
//            
//            // Turns the time difference calculation into sensible data and formats it
//            let date = Date(timeIntervalSince1970: diff)
//            let calendar = Calendar.current
//            let minutes = calendar.component(.minute, from: date)
//            let seconds = calendar.component(.second, from: date)
//
//            // Updates the time string with the formatted time
//            self.minutes = Float(minutes)
//            self.time = String(format:"%d:%02d", minutes, seconds)
//        }
//    }
//}

extension DetailView {
    final class ViewModel: ObservableObject {
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var time: String = "1:00"
        @Published var totalSeconds: Float = 60 {  // Store time in seconds
            didSet {
                self.updateTimeString()  // Update the time display when seconds change
                saveTotalSeconds()       // Save to UserDefaults
            }
        }
        
        // Initialize by loading saved totalSeconds value
        init() {
            self.totalSeconds = loadTotalSeconds()  // Load from UserDefaults
        }
        
        // Save totalSeconds to UserDefaults
        private func saveTotalSeconds() {
            UserDefaults.standard.set(totalSeconds, forKey: "totalSeconds")
        }
        
        // Load totalSeconds from UserDefaults
        private func loadTotalSeconds() -> Float {
            // Using UserDefaults.standard.object(forKey: "totalSeconds") allows you to check if the key exists
            let savedSeconds = UserDefaults.standard.object(forKey: "totalSeconds") as? Float
            return savedSeconds ?? 60  // Return 60 if no value is stored
        }
        
        var initialSeconds: Float = 60  // Initial time in seconds (e.g., 1 minute)
        private var endDate = Date()
        
        // Update the time string to show minutes and seconds
        private func updateTimeString() {
            let minutes = Int(totalSeconds) / 60
            let seconds = Int(totalSeconds) % 60
            self.time = String(format: "%d:%02d", minutes, seconds)
        }

        // Start the timer with the given amount of seconds
        func start(seconds: Float) {
            self.initialSeconds = seconds
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .second, value: Int(seconds), to: endDate)!
        }
        
        // Reset the timer
        func reset() {
            self.totalSeconds = initialSeconds
            self.isActive = false
        }
        
        // Show updates of the timer
        func updateCountdown() {
            guard isActive else { return }
            
            // Gets the current date and makes the time difference calculation
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            // Checks that the countdown is not <= 0
            if diff <= 0 {
                self.isActive = false
                self.totalSeconds = 0
                self.showingAlert = true
                return
            }
            
            // Update the totalSeconds based on the remaining time
            self.totalSeconds = Float(diff)
        }
    }
}
