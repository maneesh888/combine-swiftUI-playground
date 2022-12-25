//
//  TaskListViewModel.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 24/12/22.
//

import Foundation
import Combine
import Resolver

class TaskListViewModel: ObservableObject {
    
    @Published var taskRepository: TaskRepository = Resolver.resolve()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cacnellables = Set<AnyCancellable>()
    
    init() {
        taskRepository.$tasks.map { tasks in
            tasks.map { task in
                TaskCellViewModel(task:task)
            }
        }
        .assign(to: \.taskCellViewModels, on: self)
        .store(in: &cacnellables)
    }
    
    func removeTasks(atOffesets indexSet: IndexSet) {
        let viewModels = indexSet.lazy.map { self.taskCellViewModels[$0] }
        viewModels.forEach { taskCellViewModel in
            taskRepository.removeTask(taskCellViewModel.task)
        }
    }
    
    func addTask(task:Task) {
        taskRepository.addTask(task)
    }
}
