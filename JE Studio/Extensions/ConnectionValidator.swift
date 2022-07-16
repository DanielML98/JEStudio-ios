//
//  ConnectionValidator.swift
//  JE Studio
//
//  Created by Daniel Martínez on 17/07/22.
//

import Foundation
import Network

class ConnectionValidator {
  var userHasConnection: Bool = true
  static let shared = ConnectionValidator()
  var connectionType: NWInterface.InterfaceType = .other
  
  private init() {}
  
  func startMonitoring() {
    let monitor = NWPathMonitor()
    monitor.pathUpdateHandler = { path in
      if path.status == .satisfied {
        self.userHasConnection = true
      } else {
        self.userHasConnection = false
      }
    }
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    monitor.start(queue: queue)
  }
}
