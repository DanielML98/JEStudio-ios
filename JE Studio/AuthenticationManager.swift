//
//  AuthenticationManager.swift
//  JE Studio
//
//  Created by Daniel Martínez on 15/07/22.
//

import Foundation
import Firebase
import FirebaseAuth


final class AuthenticationManager {
  static func getCurrentUser() -> User? {
    Auth.auth().currentUser
  }
  
  static func getUserId() -> String? {
    Auth.auth().currentUser?.uid
  }
}
