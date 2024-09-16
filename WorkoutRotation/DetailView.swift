//
//  DetailView.swift
//  WorkoutRotation
//
//  Created by Oliver Hu on 9/6/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext // Access the model context
    @State private var notes: String // State to hold the notes
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var nameFieldIsFocused: Bool
    
    let item: Item
    
    @StateObject private var vm = ViewModel()
     private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
     private let width: Double = 150
    
    init(item: Item) {
        self.item = item
        _notes = State(initialValue: item.notes ?? "") // Initialize with existing notes or default
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    vm.reset()
                } label: {
                    Image(systemName: "restart.circle.fill")
                        .frame(width: 55, height: 55)
                        .tint(.red)
                }
                .padding(.horizontal, 12)
                .frame(width: 55)
                .background(.thinMaterial)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 4)
                )
                
                VStack {
                    Text("\(vm.time)")
                        .font(.system(size: 55, weight: .medium, design: .rounded))
                        .alert("Time", isPresented: $vm.showingAlert) {
                            Button("Continue", role: .cancel) {
                                vm.time = "1:00"
                                vm.minutes = 1.0
                                vm.isActive = false
                                
                            }
                        }
                        .padding(10)
                        .frame(width: width)
                        .background(.thinMaterial)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 4)
                        )
                    
                    //                    Slider(value: $vm.minutes, in: 1...5, step: 1)
                    //                    //                      .padding()
                    //                        .disabled(vm.isActive)
                    //                        .animation(.easeInOut, value: vm.minutes)
                    //                        .frame(width: width)
                    //                }
                    //                .padding(.horizontal)
                }
                Button {
                    vm.start(minutes: vm.minutes)
                } label: {
                    Image(systemName: "play.circle.fill")
                        .frame(width: 55, height: 55)
                        
                }
                .padding(.horizontal, 12)
                .frame(width: 55)
                .background(.thinMaterial)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 4)
                )
                .disabled(vm.isActive)
              
                
           

//                    .frame(width: width)
//                    .padding(.top)

            }
              .onReceive(timer) { _ in
                  vm.updateCountdown()
              }
            
            TextEditor(text: $notes)
                .padding(.horizontal)
                .onDisappear {
                    saveNotes() // Save notes when the view disappears
                }
                .focused($nameFieldIsFocused)
        }
        .padding()
        .navigationTitle("\(item.title)")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    saveNotes() // Save notes on button tap
                    dismiss()
                }
            }
        }
        .onAppear {
            // Automatically focus the text field when the view appears
           
                nameFieldIsFocused = true
            
        }
    }
    
    // Function to save notes
    private func saveNotes() {
        item.notes = notes // Update the item's notes property
        do {
            try modelContext.save() // Save changes to the context
        } catch {
            print("Failed to save notes: \(error.localizedDescription)")
        }
    }
}


//struct DetailView: View {
//    @State private var notes = "Enter your notes"
//    
//    let item: Item
//    
//    var body: some View {
//        Text("\(item.title)")
//            .font(.title)
//            .fontWeight(.semibold)
//        
//            TextEditor(text: $notes)
//                .padding(.horizontal)
//               
//        
//    }
//}

#Preview {
    DetailView(item: DeveloperPreview.item)
}
