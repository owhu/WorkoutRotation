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
    //    @State private var sortOrder = [
    //        SortDescriptor(\Item.dateAdded),
    //    ]
    @State private var itemType = "All"
    //    @State private var showingAlert = false
    
    
    var body: some View {
        NavigationStack {
            VStack{
                ListItemView()
                    .toolbar {
                        
                        
                        Button("Uncheck All Items", systemImage: "checkmark.circle.badge.xmark") {
                            for item in items {
                                item.isChecked = false
                            }
                        }
                        
                        //                        Button("Empty List", systemImage: "trash") {
                        //                            showingAlert = true
                        //                        }
                        //                        .alert("Delete all items?", isPresented: $showingAlert) {
                        //                            Button("OK", role: .destructive) {
                        //                                for item in items {
                        //                                    modelContext.delete(item)
                        //                                }
                        //                            }
                        //                        }
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self)
}



