//
//  SwiftUIView.swift
//  ToDoSwiftUI
//
//  Created by user259661 on 9/27/24.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var viewModel: TaskListViewModel
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.tasks) { task in
                    VStack {
                        Text(task.name)
                        Text("\(task.date)")
                    }
                }
            }.navigationTitle("Tasks")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: {
                            TaskView { task in
                                viewModel.addTask(task: task)
                            }
                        }) {
                            Image(systemName: "plus")
                        }
                        
                        
                    }
                }
        }
        
    }
}

#Preview {
    TaskListView(viewModel: TaskListViewModel())
}
