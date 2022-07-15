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
  let dataManager: DataManager = DataManager()
  
  init(session: Session) {
    currentSession = session
  }
  
  func getGridViewModel() -> BikeGridViewModel {
    let gridModel = BikeGridViewModel(participants: currentSession.participants, selectedBike: selectedBikeNumber)
    gridModel.delegate = self
    return gridModel
  }

  func bookPlaceIn() {
    updateParticipants()
    dataManager.bookPlaceIn(session: currentSession, updatedParticipants: currentSession.participants)
  }

  private func updateParticipants() {
    guard let userId: String = AuthenticationManager.getUserId() else { return }
    currentSession.participants[userId] = selectedBikeNumber
  }
}

extension BikeSelectionViewModel: BikeGridDelegate {
  func didSelectBike(number: Int) {
    selectedBikeNumber = number
  }
}
