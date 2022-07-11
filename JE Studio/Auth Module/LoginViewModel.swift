//
//  LoginViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 06/07/22.
//

import Foundation
import FirebaseAuth

final class LoginViewModel: ObservableObject {
  
  @Published var shouldShowWarning: Bool = false
  
  func checkPassword(_ password: String) {
    
  }
  
  func checkCredentials(email: String, password: String, completion: @escaping  () -> Void) {
    guard !email.isEmpty, !password.isEmpty else { return } //TODO: Tell the view to show empty alert
    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
      if error == nil {
        completion()
      } else {
        print("❌\(error.debugDescription)")
      }
    }
  }
  
  func showPasswordGuidelines() {
    shouldShowWarning.toggle()
  }
  
  func isNotEmpty() {
    
  }
}

extension String {
  func isNotEmpty() -> Bool {
    !self.isEmpty
  }
}
