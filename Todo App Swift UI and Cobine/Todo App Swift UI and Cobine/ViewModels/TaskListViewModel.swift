//
//  TaskListViewModel.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 24/12/22.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cacnellables = Set<AnyCancellable>()
    
    init() {
        self.taskCellViewModels = testDataTasks.map({ task in
            TaskCellViewModel(task:task)
        })
    }
    
    func removeTasks(atOffesets indexSet: IndexSet) {
        taskCellViewModels.remove(atOffsets: indexSet)
    }
    
    func addTask(task:Task) {
        taskCellViewModels.append(TaskCellViewModel(task:task))
    }
}
