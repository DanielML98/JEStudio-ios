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
  
  static func logOut() {
    do {
      try Auth.auth().signOut()
    }
    catch {
      print(error)
    }
  }
  
  static func signUp(email: String, password: String, completion: @escaping (Result<Any, Error>) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { data, error in
      if error != nil {
        completion(.failure(error!))
      }
      completion(.success(data))
    }
  }
  
  static func signIn(email: String, password: String, completion: @escaping (Result<Any, Error>) -> Void) {
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      if error == nil {
        completion(.success(authResult))
      } else {
        completion(.failure(error!))
      }
    }
  }
}
