//
//  ContentView.swift
//  Demo_TODO
//
//  Created by Matrix on 06/10/23.
//

import SwiftUI
import SwiftData

struct TaskRow: View {
    var taskName: Item

    var body: some View {
        Text(taskName.taskContent ?? "task")
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query  var items: [Item]
    @State private var showingAlert = false
    @State private var name = ""

    var body: some View {
            ZStack(alignment: .bottom){
                List {
                    ForEach(items) { item in
                        TaskRow(taskName: item)
                    }
                    .onDelete(perform: remove)
                }
            }.listStyle(PlainListStyle()) // Prevent List from reducing its size when empty
            .background(Color.clear)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        showingAlert.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill") // Add Task button icon
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .foregroundColor(.yellow)
                    .padding()
                    .background(Color.green)
                    .clipShape(Circle()) // Rounded design for the button// Adjust the button's vertical position
                }.padding()
            }
            .alert("Enter your Task", isPresented: $showingAlert) {
                TextField("Task name", text: $name)
                Button("OK", action: addItem)
            }
    }
    

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), taskContent: name)
            if !(name.isEmpty) {
                modelContext.insert(newItem)
                name = ""
            }
        }
    }
    
    private func remove(at offsets: IndexSet) {
            withAnimation {
                for offset in offsets {
                    let item = items[offset]
                    modelContext.delete(item)
                }
            }
        }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
