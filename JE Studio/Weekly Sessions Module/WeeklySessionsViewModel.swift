//
//  WeeklySessionsViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 10/07/22.
//

import Foundation

final class WeeklySessionsViewModel: ObservableObject {

  @Published var availableSessions: [Session] = []

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
  
  
}