//
//  TaskRepository.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 24/12/22.
//

import Foundation
import Disk


class BaseTaskRepository {
  @Published var tasks = [Task]()
}

protocol TaskRepository: BaseTaskRepository {
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
    func updateTask(_ task: Task)
}

class LocalTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
    
    
    override init() {
        super.init()
        loadData()
    }
    
    
    func addTask(_ task: Task) {
        tasks.append(task)
        saveData()
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
        saveData()
    }
    
    func updateTask(_ task: Task) {
        if let index = self.tasks.firstIndex(where: { $0.id == task.id } ) {
            self.tasks[index] = task
        }
        saveData()
    }
    
    private func loadData() {
        if let retrievedTasks = try? Disk.retrieve("tasks.json", from: .documents, as: [Task].self) {
            self.tasks = retrievedTasks
        }
    }
    
    private func saveData() {
        do {
            try Disk.save(self.tasks, to: .documents, as: "tasks.json")
        }
        catch let error as NSError {
            fatalError("""
                    Domain: \(error.domain)
                    Code: \(error.code)
                    Description: \(error.localizedDescription)
                    Failure Reason: \(error.localizedFailureReason ?? "")
                    Suggestions: \(error.localizedRecoverySuggestion ?? "")
                    """)
        }
    }
    
}




class TestDataTaskRepository: BaseTaskRepository, TaskRepository, ObservableObject {
    
    override init() {
        super.init()
        self.tasks = testDataTasks
    }
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func removeTask(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks.remove(at: index)
        }
    }
    
    func updateTask(_ task: Task) {
        if let index = self.tasks.firstIndex(where: { $0.id == task.id } ) {
            self.tasks[index] = task
        }
    }
}
