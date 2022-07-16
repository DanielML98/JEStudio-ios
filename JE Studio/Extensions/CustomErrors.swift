//
//  CustomErrors.swift
//  JE Studio
//
//  Created by Daniel Martínez on 17/07/22.
//

import Foundation

enum CustomErrors {
  case alreadyBooked
  case notConnectedToInternet
  
  var title: String {
    switch self {
    case .notConnectedToInternet:
      return "Error de conexión"
    default:
      break
    }
    return "Error"
  }
  
  var message: String {
    switch self {
    case .notConnectedToInternet:
      return "Por favor revise que tiene conexión a internet"
    default:
      break
    }
    return "Algo malo sucedió"
  }
}
