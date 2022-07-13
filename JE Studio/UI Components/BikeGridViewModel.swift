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
  var selectedBikeNumber: Int = Int.zero

  init(participants model: [String:Int]) {
    self.bikeSpots = model
    populateRows()
  }

  private func populateRows(selectedBike: Int = Int.zero) {
    for bikeNumber in 1...4  {
      frontRow.append(Bike(bikeNumber: bikeNumber, isTaken: bikeSpots.values.contains(bikeNumber), isSelected: bikeNumber == selectedBike))
    }
    for bikeNumber in 5...8 {
      backRow.append(Bike(bikeNumber: bikeNumber, isTaken: bikeSpots.values.contains(bikeNumber), isSelected: bikeNumber == selectedBike))
    }
  }

  func selectBike(_ bikeNumber: Int) {
    frontRow = []
    backRow = []
    selectedBikeNumber = bikeNumber
    populateRows(selectedBike: bikeNumber)
  }
}
