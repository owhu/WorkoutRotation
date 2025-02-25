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
                                VStack {
                                    NavigationLink(value: item) {
                                        Text(item.title)
                                            .foregroundStyle(.white)
                                            .padding()
                                            .frame(width: 155, height: 155)
                                            .background(Color.gray.opacity(0.5))
                                            .cornerRadius(10)
                                    }
                                    WeeklyHabitTrackerView(item: item)
                                }
                            }
                        }
                        .padding()
                    }
                    
//                    List {
//                        ForEach(items) { item in
//                            VStack {
//                                NavigationLink(value: item) {
//                                    Text(item.title)
//                                        .foregroundStyle(.white)
//                                        .padding()
////                                        .frame(maxWidth: .infinity)
//                                        .frame(width: 155, height: 155)
//                                        .background(Color.gray.opacity(0.5))
//                                        .cornerRadius(10)
//                                }
//                                WeeklyHabitTrackerView(item: item)
//                            }
//                           
//                        }
//                        .onDelete { indexSet in
//                            for index in indexSet {
//                                modelContext.delete(items[index])
//                            }
//                        }
//                    }
//                    .listStyle(.plain)
                    
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

#Preview {
    ListItemView()
        .modelContainer(for: Item.self)
}
