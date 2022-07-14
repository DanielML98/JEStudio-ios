//
//  BikeSelectionViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 14/07/22.
//

import Foundation

final class BikeSelectionViewModel: ObservableObject {
  @Published var currentSession: Session
  @Published var selectedBikeNumber: Int = 0
  
  init(session: Session) {
    currentSession = session
  }
  
  func getGridViewModel() -> BikeGridViewModel {
    let gridModel = BikeGridViewModel(participants: currentSession.participants)
    gridModel.delegate = self
    return gridModel
  }
}

extension BikeSelectionViewModel: BikeGridDelegate {
  func didSelectBike(number: Int) {
    selectedBikeNumber = number
  }
}
