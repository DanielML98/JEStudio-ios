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
  @Published var state: CallState = .loading
  let studio: SpinningStudio

  init(for studio: SpinningStudio) {
    self.studio = studio
  }
  
  func getBikeSelectionModel() -> BikeSelectionViewModel {
    BikeSelectionViewModel(session: sessionSelected)
  }

  func updateSelection(to session: Session) {
    self.sessionSelected = session
  }

  func getSessions() {
    DataManager().getSessions(for: studio) { result in
      switch result {
      case .success(let sessions):
        DispatchQueue.main.async {
          self.state = .success
          self.availableSessions = sessions
        }
      case .failure(_):
        DispatchQueue.main.async {
          self.state = .failure
        }
      }
    }
  }
}

enum CallState {
  case loading
  case success
  case failure
}
