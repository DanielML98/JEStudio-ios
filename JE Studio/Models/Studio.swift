//
//  Studio.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import Foundation

struct Studio: Identifiable {
  var id: String {
    self.name
  }
  let name: String
  let capacity: String

  func getStudio() -> SpinningStudio {
    if let spinningStudio = SpinningStudio(rawValue: self.name.lowercased()) {
      return spinningStudio
    } else {
      return .universidad
    }
  }
}
