//
//  ContentView.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 9/3/24.
//

import SwiftUI
import SwiftData



struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var items: [Item]
    @State private var showingAddItem = false
    @State private var itemType = "All"
    
    var body: some View {
        NavigationStack {
            VStack{
                ListItemView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Workout")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self)
}



