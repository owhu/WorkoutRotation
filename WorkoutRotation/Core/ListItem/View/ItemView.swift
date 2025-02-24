//
//  ItemView.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 9/3/24.
//

import SwiftUI
import SwiftData

struct ListItemView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var items: [Item]
    
    @State private var showingAddItem = false
    @State private var draggedItem: Item?
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 155))
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(items) { item in
                                NavigationLink(value: item) {
                                    Text(item.title)
                                        .foregroundStyle(.white)
                                        .padding()
                                        .frame(width: 155, height: 155)
                                        .background(Color.gray.opacity(0.5))
                                        .cornerRadius(10)
                                }
                                WeeklyHabitTrackerView(item: item)
                                
                                
                                //                            ForEach(items) { item in
                                //                                TimeBlockView(item: item)
                                //                                    .draggable(item) {
                                //                                        // This is the preview while dragging
                                //                                        TimeBlockView(item: item)
                                //                                            .frame(width: 155, height: 155)
                                //                                    }
                                //                            }
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    Button {
                        showingAddItem = true
                    } label: {
                        Image(systemName: "plus")
                            .modifier(StandardButtonModifier())
                    }
                    .padding()
                    
                    .sheet(isPresented: $showingAddItem) {
                        AddView()
                    }
                }
            }
            .navigationDestination(for: Item.self) { item in
                DetailView(item: item)
            }
        }
    }
}

struct TimeBlockView: View {
    let item: Item
    
    var body: some View {
        Text(item.title)
            .foregroundStyle(.white)
            .padding()
            .frame(width: 155, height: 155)
            .background(Color.gray.opacity(0.5))
            .cornerRadius(10)
    }
}


#Preview {
    ListItemView()
        .modelContainer(for: Item.self)
}
