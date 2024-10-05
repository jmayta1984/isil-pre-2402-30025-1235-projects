//
//  TaskView.swift
//  ToDoSwiftUI
//
//  Created by user259661 on 9/27/24.
//

import SwiftUI

struct TaskView: View {
    
    var onAddTask: (Task) -> Void
    @State private var task: String = ""
    @State private var date: Date = Date()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Task", text: $task)
                    .textFieldStyle(.roundedBorder).padding()
                DatePicker("Fecha", selection: $date, displayedComponents: .date)
            }
            .navigationTitle("New task")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        if !task.isEmpty {
                            let newTask = Task(name: task, date:date, isCompleted: false)
                            onAddTask(newTask)
                            dismiss()
                        }
                    }, label: {
                        Image(systemName: "square.and.arrow.down")
                    })
                }
            }
        }
        
    }
}

#Preview {
    TaskView { task in
        print(task.name)
    }
}
