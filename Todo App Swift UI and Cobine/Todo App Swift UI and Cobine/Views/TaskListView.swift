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
                        Text(task.title)
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

struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView()
  }
}
