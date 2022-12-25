//
//  Task.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 23/12/22.
//

import Foundation

enum TaskPriority: Int, Codable {
    case high, medium, low
}

struct Task: Identifiable, Codable {
    var id: String = UUID().uuidString
    var title: String
    var priority: TaskPriority
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
  Task(title: "Implement UI", priority: .medium, completed: true),
  Task(title: "Connect to Firebase", priority: .medium, completed: false),
  Task(title: "????", priority: .high, completed: false),
  Task(title: "PROFIT!!!", priority: .high, completed: false)
]
#endif
