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
  var body: some View {
    NavigationView {
      ZStack {
        NavigationLink(tag: 1, selection: $navigationAction) {
          SignUpView()
        } label: {
          EmptyView()
        }
        VStack {
          Text("Please login")
            .font(.jeHeader2)
            .foregroundColor(JEStudioColor.purple700)
          HStack {
            Text("Or if you dont have an account")
              .font(.jeBody1)
              .lineLimit(1)
            Button("Sign up") {
              navigationAction = 1
            }
            .foregroundColor(JEStudioColor.purple600)
            .cornerRadius(8)
            .font(.jeBody1)
          }
          .padding()
          VStack {
            TextField("email", text: $username)
              .textFieldStyle(.roundedBorder)
              .font(.jeHeader5)
              .foregroundColor(JEStudioColor.purple700)
              .padding(.bottom, 8)
            TextField("Password", text: $password, onCommit: {
              viewModel.checkPassword(password)
            })
            .textFieldStyle(.roundedBorder)
            .foregroundColor(JEStudioColor.purple700)
            .font(.jeHeader5)
            .padding(.top, 8)
          }
          .padding(.horizontal, 8)
          Spacer()
          Button("Sign in") {
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
      .navigationBarHidden(true)
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(viewModel: LoginViewModel())
  }
}
