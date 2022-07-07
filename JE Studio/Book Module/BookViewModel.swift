//
//  BookViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import Foundation

final class BookViewModel: BookViewModelProtocol, ObservableObject {
  var studios: [Studio] = [Studio(name: "Universidad 54", capacity: "7"), Studio(name: "Moderna", capacity: "10")]
  var viewTitle: String { return BookLocalizables.viewTitle }
  func goToAvailableSessions(studio: Studio) {
    
  }
}

protocol BookViewModelProtocol {
  
}
