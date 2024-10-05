//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by user259661 on 9/20/24.
//

import SwiftUI

@main
struct ToDoSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TaskListView(viewModel: TaskListViewModel())
        }
    }
}
