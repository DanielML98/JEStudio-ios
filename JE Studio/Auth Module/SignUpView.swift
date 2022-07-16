//
//  SignUpView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 08/07/22.
//

import SwiftUI

struct SignUpView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @StateObject var viewModel: SignUpViewModel
  @State var name: String = String()
  @State var lastName: String = String()
  @State var email: String = String()
  @State var password: String = String()
  @State var passwordConfirmation: String = String()
  
  var body: some View {
    ZStack {
      VStack {
        HStack {
          Text("Or if you dont have an account")
            .font(.jeBody1)
            .lineLimit(1)
          Button("Sign up") {
            print("Hola")
          }
          .foregroundColor(JEStudioColor.purple600)
          .cornerRadius(8)
          .font(.jeBody1)
        }
        .padding()
        ScrollView {
          VStack {
            TextField("Nombre", text: $name, onCommit: {
              viewModel.checkForEmptyField(name)
            })
              .disableAutocorrection(true)
              .textFieldStyle(.roundedBorder)
              .font(.jeHeader5)
              .foregroundColor(JEStudioColor.purple700)
              .padding(.bottom, 8)
            TextField("Apellido", text: $lastName, onCommit: {
              viewModel.checkForEmptyField(lastName)
            })
              .disableAutocorrection(true)
              .textFieldStyle(.roundedBorder)
              .font(.jeHeader5)
              .foregroundColor(JEStudioColor.purple700)
              .padding(.bottom, 8)
            TextField("email", text: $email, onCommit: {
              viewModel.checkForEmptyField(email)
            })
              .autocapitalization(.none)
              .disableAutocorrection(true)
              .textFieldStyle(.roundedBorder)
              .font(.jeHeader5)
              .foregroundColor(JEStudioColor.purple700)
              .padding(.bottom, 8)
            SecureField("Password", text: $password, onCommit: {
              viewModel.checkForEmptyField(password)
            })
              .textInputAutocapitalization(.never)
              .textFieldStyle(.roundedBorder)
              .foregroundColor(JEStudioColor.purple700)
              .font(.jeHeader5)
              .padding(.top, 8)
            SecureField("Confirm Password", text: $passwordConfirmation, onCommit: {
              viewModel.checkForEmptyField(passwordConfirmation)
            })
              .textInputAutocapitalization(.never)
              .textFieldStyle(.roundedBorder)
              .foregroundColor(JEStudioColor.purple700)
              .font(.jeHeader5)
              .padding(.top, 8)
          }
        }
        .padding(.horizontal, 8)
        Spacer()
        Button("Sign Up") {
          viewModel.checkForm(name,
                              lastName,
                              email,
                              password,
                              passwordConfirmation)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(JEStudioColor.purple100)
        .background(JEStudioColor.purple500)
        .font(.jeHeader5)
      }
    }
    .addJENavBar(with: "Please Sign Up")
    .alert(isPresented: $viewModel.shoulShowAlert, error: viewModel.error, actions: { error in
      Text("Retry")
    }) { error in
      Text(error.failureReason ?? "")
    }
  }
}

//struct SignUpView_Previews: PreviewProvider {
//  static var previews: some View {
//    SignUpView(viewModel: SignUpViewModel(), isLoggedIn: Binding<false>)
//  }
//}
