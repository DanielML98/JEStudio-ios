//
//  LoginView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 06/07/22.
//

import SwiftUI

struct LoginView: View {
  
  @ObservedObject var viewModel: LoginViewModel
  @State var username: String = String()
  @State var password: String = String()
    var body: some View {
      ZStack {
        VStack {
          Text("Please login")
            .font(.jeHeader2)
          .foregroundColor(JEStudioColor.purple700)
          TextField("Username", text: $username)
            .textFieldStyle(.roundedBorder)
            .font(.jeHeader6)
            .foregroundColor(JEStudioColor.purple700)
          TextField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(JEStudioColor.purple700)
            .font(.jeHeader6)
          Button("Sign in") {
            print("Hola")
          }
          .padding()
          .foregroundColor(JEStudioColor.purple100)
          .background(JEStudioColor.purple500)
          .cornerRadius(8)
          .font(.jeHeader5)
          
          HStack {
            Text("Or if you dont have an account")
              .font(.jeBody1)
              .lineLimit(1)
            Button("Sign up") {
              print("Hola")
            }
            .foregroundColor(JEStudioColor.purple700)
            .cornerRadius(8)
            .font(.jeBody1)
          }
          .padding(8)
          Spacer()
        }
      }
      .onTapGesture {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
