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
    
    let savePath = URL.documentsDirectory.appending(path: "SavedItems.json")
    @State private var savedResults = [Item]()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(items) { item in
                            NavigationLink(value: item) {
                                HStack {
                                    Text(item.title)
                                    Spacer()
                                    Image(systemName: item.isChecked ? "checkmark.square" : "square")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(item.isChecked ? .blue : .gray)
                                        .onTapGesture {
                                            toggleCheck(item)
                                        }
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                showingAddItem = true
                            } label: {
                                Image(systemName: "plus")
                            }
                            .padding()
                        }
                        .padding()
                    }
                    .sheet(isPresented: $showingAddItem) {
                        AddView()
                    }
        
                }
            }
            .navigationDestination(for: Item.self) { item in
                Text("Detail View")
            }
        }
    }

    init(type: String = "All", sortOrder: [SortDescriptor<Item>]) {
        _items = Query(filter: #Predicate {
            if type == "All" {
                return true
            } else {
                return $0.type == type
            }
        }, sort: sortOrder)
    }
    
    func toggleCheck(_ selectedItem: Item) {
        if selectedItem.isChecked {
            // Uncheck the item if it is already checked
            if let index = items.firstIndex(where: { $0.id == selectedItem.id }) {
                items[index].isChecked = false
                selectedItem.type = "Unchecked"
            }
        } else {
            // Check the selected item
            if let index = items.firstIndex(where: { $0.id == selectedItem.id }) {
                items[index].isChecked = true
                selectedItem.type = "Checked"
            }
        }
    }
    

    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset]
            modelContext.delete(item)
        }
    }
}


#Preview {
    ListItemView(sortOrder: [SortDescriptor(\Item.title)])
        .modelContainer(for: Item.self)
}
