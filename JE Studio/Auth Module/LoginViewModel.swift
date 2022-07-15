//
//  LoginViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 06/07/22.
//

import Foundation
import FirebaseAuth

final class LoginViewModel: ObservableObject {
  typealias Strings = AuthLocalizables
  var signInLabel: String { Strings.signInLabel }
  var signUpLabel: String { Strings.signUpLabel }
  var passwordPlaceholder: String { Strings.passwordPlaceholder }
  var emailPlaceholder: String { Strings.emailPlaceholder }
  var notRegisteredPrompt: String { Strings.notRegisteredPrompt }
  var loginPrompt: String { Strings.loginPrompt }

  
  @Published var shouldShowAlert: Bool = false
  var error: SignInError = .somethingWentWrong
  
  func checkPassword(_ password: String) {
    
  }
  
  func checkCredentials(email: String, password: String, completion: @escaping  () -> Void) {
    guard !email.isEmpty, !password.isEmpty
    else {
      showAlert(for: .emptyFields)
      return }
    AuthenticationManager.signIn(email: email, password: password) { result in
      switch result {
      case .success(_):
        completion()
      case .failure(let error):
        self.showAlert(for: .somethingWentWrong)
      }
    }
  }
  
  func showAlert(for error: SignInError) {
    self.error = error
    shouldShowAlert.toggle()
  }
}

enum SignInError: Error, LocalizedError {
  case somethingWentWrong
  case emptyFields
  
  var errorDescription: String? {
    switch self {
    case .somethingWentWrong:
      return "Something went wrong"
    case .emptyFields:
      return "Empty Fields"
    }
  }
  /// A localized message describing the reason for the failure.
  var failureReason: String? {
    switch self {
    case .somethingWentWrong:
      return "Check your credentials or try again"
    case .emptyFields:
      return "Please fill in missing fields"
    }
  }
}

