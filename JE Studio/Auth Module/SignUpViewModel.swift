//
//  SignUpViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 17/07/22.
//

import Foundation
import SwiftUI
typealias Strings = AuthLocalizables

final class SignUpViewModel: ObservableObject {
  var signInLabel: String { Strings.signInLabel }
  var signUpLabel: String { Strings.signUpLabel }
  var existingAccountTip: String { Strings.existingAccountDisclaimer }
  var namePlaceholder: String { Strings.namePlaceholder }
  var lastNamePlaceholder: String { Strings.lastNamePlaceholder }
  var passwordPlaceholder: String { Strings.passwordPlaceholder }
  var emailPlaceholder: String { Strings.emailPlaceholder }
  var passwordConfirmationPlaceholder: String { Strings.passwordConfirmationPlaceholder }
  var viewTitle: String { Strings.signUpTitle }
  @Published var shoulShowAlert: Bool = false
  @Published var error: SignUpErrors = .passwordMismatch
  var isLoggedIn: Binding<Bool>
  
  init(isLoggedIn: Binding<Bool>) {
    self.isLoggedIn = isLoggedIn
  }
  
  func checkRegistrationForm(_ password: String, passwordConfirmation: String) {
    shoulShowAlert.toggle()
  }
  
  func checkForEmptyField(_ field: String) {
    guard field.isEmpty else { return }
    self.error = .emptyFields
    self.shoulShowAlert = true
  }
  
  func checkForm(_ name: String,
                 _ lastName: String,
                 _ email: String,
                 _ password: String,
                 _ passwordConfirmation: String) {
    guard hasEmptyFieldIn(form: [name, lastName, email, password, passwordConfirmation])
    else {
      showAlert(for: .emptyFields)
      return
    }
    guard passwordIsSafeEnough(password) else {
      showAlert(for: .passwordNotSafe)
      return
    }
    guard password == passwordConfirmation else {
      showAlert(for: .passwordMismatch)
      return
    }
    signUp(email: email, password: password)
  }
  
  private func showAlert(for error: SignUpErrors) {
    self.error = error
    shoulShowAlert.toggle()
  }
  
  private func signUp(email: String, password: String) {
    AuthenticationManager.signUp(email: email, password: password) { result in
      switch result {
      case .success(_):
        self.isLoggedIn.wrappedValue.toggle()
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  private func hasEmptyFieldIn(form: [String]) -> Bool {
    form.allSatisfy { !$0.isEmpty }
  }
  
  private func passwordIsSafeEnough(_ password: String) -> Bool {
    let resultRange = password.range(of: #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$"#, options: .regularExpression)
    return resultRange != nil
  }
}

enum SignUpErrors: LocalizedError {
  case passwordMismatch
  case emptyFields
  case passwordNotSafe
  
  var errorDescription: String? {
    switch self {
    case .passwordMismatch:
      return Strings.passwordMismatchDescription
    case .emptyFields:
      return Strings.emptyFieldsDescription
    case .passwordNotSafe:
      return Strings.weakPasswordDescription
    }
  }
  /// A localized message describing the reason for the failure.
  var failureReason: String? {
    switch self {
    case .passwordMismatch:
      return Strings.passwordMismatchMessage
    case .emptyFields:
      return Strings.emptyFieldsMessage
    case .passwordNotSafe:
      return Strings.passwordGuidelines
    }
  }
}

