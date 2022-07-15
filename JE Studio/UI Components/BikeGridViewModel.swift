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
  var delegate: BikeGridDelegate?

  init(participants model: [String:Int], selectedBike: Int) {
    self.bikeSpots = model
    populateRows(selectedBike: selectedBike)
  }

  private func populateRows(selectedBike: Int) {
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
    delegate?.didSelectBike(number: bikeNumber)
  }
}

protocol BikeGridDelegate {
  func didSelectBike(number: Int)
}
