//
//  TaskRepository.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 24/12/22.
//

import Foundation


class BaseTaskRepository {
  @Published var tasks = [Task]()
}

protocol TaskRepository: BaseTaskRepository {
    func addTask(_ task: Task)
    func removeTask(_ task: Task)
    func updateTask(_ task: Task)
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
