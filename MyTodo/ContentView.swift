//
//  ContentView.swift
//  MyTodo
//
//  Created by Guest User on 2026. 09. 17..
//

import SwiftUI

struct ContentView: View {
    @State private var tasks: [TodoItem] = [
        TodoItem(title: "SwiftUI gyakorlás"),
        TodoItem(title: "Vegyél tejet", isCompleted: true),
        TodoItem(title: "Vidd le a szemetet")
    ]
    @State private var newTodoTitle: String = ""
    private func addNewTask(){
        if(!newTodoTitle.isEmpty){
            tasks.append(TodoItem(title: newTodoTitle))
        }
    }
    private func deleteTask(offsets:IndexSet){
        tasks.remove(atOffsets: offsets)
    }
        var body: some View {
        Text("Teendőim").font(.largeTitle)
        VStack {
            List {
                ForEach($tasks) { $task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle").foregroundStyle(task.isCompleted ? Color.green : Color.black)
                        Text(task.title).strikethrough(task.isCompleted, color: .secondary)
                    }.onTapGesture {
                        task.isCompleted.toggle()
                    }
                }.onDelete(perform: deleteTask)
            }
            HStack {
                TextField("Új teendő...",text: $newTodoTitle)
                Button("Hozzáad"){addNewTask()}.buttonStyle(.bordered)
            }.padding()
        }
    }
}

#Preview {
    ContentView()
}
