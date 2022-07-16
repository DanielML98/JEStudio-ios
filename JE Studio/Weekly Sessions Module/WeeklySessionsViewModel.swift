//
//  WeeklySessionsViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 10/07/22.
//

import Foundation

final class WeeklySessionsViewModel: ObservableObject {

  @Published var availableSessions: [Session] = []
  @Published var sessionSelected: Session = Session.emptySession()

  init(for studio: SpinningStudio) {
    DataManager().getSessions(for: studio) { result in
      switch result {
      case .success(let sessions):
        self.availableSessions = sessions
        print("From ViewModel➡️ \(self.availableSessions)")
      case .failure(let error):
        print("Error❌: \(error)")
      }
    }
  }
  
  func getBikeSelectionModel() -> BikeSelectionViewModel {
    BikeSelectionViewModel(session: sessionSelected)
  }

  func updateSelection(to session: Session) {
    self.sessionSelected = session
  }
}
