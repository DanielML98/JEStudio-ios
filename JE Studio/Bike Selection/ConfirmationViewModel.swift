//
//  ConfirmationViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 16/07/22.
//

import Foundation


final class ConfirmationViewModel: ObservableObject {
  let eventManager: CalendarEventManager = CalendarEventManager()
  @Published var successfullyAddedToCalendar: Bool = false
  
  func saveSessionToCalendar(date: String, startHour: String) {
    let formattter = DateFormatter()
    formattter.dateFormat = "dd/MM/yyyy HH:mm"
    guard let sessionDate = formattter.date(from: "\(date) \(startHour)")
    else {
      return
    }
    eventManager.saveEvent(date: sessionDate) { result in
      switch result {
        case .success(_):
        print("Successfully saved Session ✅")
        DispatchQueue.main.async {
          self.successfullyAddedToCalendar.toggle()
        }
      case .failure(let error):
        print("❌😢\(error.localizedDescription)")
      }
    }
  }
}
