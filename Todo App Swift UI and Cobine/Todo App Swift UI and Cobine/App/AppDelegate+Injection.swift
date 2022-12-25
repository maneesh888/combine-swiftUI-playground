//
//  AppDelegate+Injection.swift
//  Todo App Swift UI and Cobine
//
//  Created by Maneesh M on 24/12/22.
//

import Foundation
import Resolver


extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register { LocalTaskRepository() as TaskRepository }
  }
}
