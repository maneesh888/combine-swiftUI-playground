//
//  Views.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 23/12/22.
//

import SwiftUI

struct TaskListView: View {
    var tasks: [Task] = testDataTasks
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach (self.tasks) { task in
                        TaskCell(task: task)
                    }
                }
            }
        }
        Button(action: {}) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("New Task")
            }
        }
        .padding()
        .accentColor(Color(UIColor.systemRed))
        .navigationBarTitle("Tasks")
    }
}

struct TaskCell: View {
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
            Text(task.title)
        }
    }
}


struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView()
  }
}
