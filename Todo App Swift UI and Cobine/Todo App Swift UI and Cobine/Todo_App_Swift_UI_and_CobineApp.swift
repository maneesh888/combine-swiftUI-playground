//
//  Todo_App_Swift_UI_and_CobineApp.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 23/12/22.
//

import SwiftUI

@main
struct Todo_App_Swift_UI_and_CobineApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
        }
    }
}
