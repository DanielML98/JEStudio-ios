//
//  LoginView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 06/07/22.
//

import SwiftUI

struct LoginView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var viewModel: LoginViewModel
  @State var username: String = String()
  @State var password: String = String()
  @State var navigationAction: Int? = 0
  @Binding var isLoggedIn: Bool
  var body: some View {
    NavigationView {
      ZStack {
        NavigationLink(tag: 1, selection: $navigationAction) {
          SignUpView(viewModel: SignUpViewModel(isLoggedIn: self.$isLoggedIn))
        } label: {
          EmptyView()
        }
        VStack {
          Text(viewModel.loginPrompt)
            .font(.jeHeader2)
            .foregroundColor(JEStudioColor.purple700)
          HStack {
            Text(viewModel.notRegisteredPrompt)
              .font(.jeBody1)
              .lineLimit(1)
            Button(viewModel.signUpLabel) {
              navigationAction = 1
            }
            .foregroundColor(JEStudioColor.purple600)
            .cornerRadius(8)
            .font(.jeBody1)
          }
          .padding()
          VStack {
            TextField(viewModel.emailPlaceholder, text: $username)
              .autocapitalization(.none)
              .disableAutocorrection(true)
              .textFieldStyle(.roundedBorder)
              .font(.jeHeader5)
              .foregroundColor(JEStudioColor.purple700)
              .padding(.bottom, 8)
            SecureField(viewModel.passwordPlaceholder, text: $password)
              .textInputAutocapitalization(.never)
              .textFieldStyle(.roundedBorder)
              .foregroundColor(JEStudioColor.purple700)
              .font(.jeHeader5)
              .padding(.top, 8)
          }
          .padding(.horizontal, 8)
          Spacer()
          Button(viewModel.signInLabel) {
            viewModel.checkCredentials(email: username, password: password) {
              dismiss()
            }
          }
          .frame(maxWidth: .infinity)
          .padding()
          .foregroundColor(JEStudioColor.purple100)
          .background(JEStudioColor.purple500)
          .font(.jeHeader5)
        }
      }
      .alert(isPresented: $viewModel.shouldShowAlert, error: viewModel.error, actions: { _ in
        EmptyView()
      }) { error in
        Text(error.failureReason ?? String())
      }
      .navigationBarHidden(true)
    }
  }
}

//struct LoginView_Previews: PreviewProvider {
//  static var previews: some View {
//    LoginView(viewModel: LoginViewModel(), isLoggedIn: Binding<false>)
//  }
//}
