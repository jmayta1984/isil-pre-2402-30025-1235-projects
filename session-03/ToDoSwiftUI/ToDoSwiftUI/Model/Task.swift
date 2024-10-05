//
//  Task.swift
//  ToDoSwiftUI
//
//  Created by user259661 on 9/27/24.
//

import Foundation

typealias Tasks = [Task]

struct Task: Identifiable {
    let id = UUID()
    var name: String
    var date: Date
    var isCompleted: Bool
}
