//
//  Bike.swift
//  JE Studio
//
//  Created by Daniel Martínez on 12/07/22.
//

import Foundation

struct Bike: Identifiable {
  var id: Int {
    self.bikeNumber
  }
  let bikeNumber: Int
  let isTaken: Bool
}
