//
//  TaskListViewModel.swift
//  ToDoSwiftUI
//
//  Created by user259661 on 9/27/24.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published private (set) var tasks = Tasks()
    
    func addTask(task: Task) {
        tasks.append(task)
    }
}
