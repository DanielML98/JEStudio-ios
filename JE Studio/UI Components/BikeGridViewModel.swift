//
//  BikeGridViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 11/07/22.
//

import Foundation


final class BikeGridViewModel: ObservableObject {
  
  @Published var bikeSpots: [String:Int]
  @Published var frontRow: [Bike] = []
  @Published var backRow: [Bike] = []

  init(participants model: [String:Int]) {
    self.bikeSpots = model
    populateRows()
  }

  func populateRows() {
    for bikeNumber in 1...4  {
      frontRow.append(Bike(bikeNumber: bikeNumber, isTaken: bikeSpots.values.contains(bikeNumber)))
    }
    for bikeNumber in 5...8 {
      backRow.append(Bike(bikeNumber: bikeNumber, isTaken: bikeSpots.values.contains(bikeNumber)))
    }
  }
}
