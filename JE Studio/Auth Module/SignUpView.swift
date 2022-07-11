//
//  SignUpView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 08/07/22.
//

import SwiftUI

struct SignUpView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  @State var username: String = String()
  @State var password: String = String()
  
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
        VStack {
          TextField("Nombre", text: $username)
            .textFieldStyle(.roundedBorder)
            .font(.jeHeader5)
            .foregroundColor(JEStudioColor.purple700)
            .padding(.bottom, 8)
          TextField("Apellido", text: $username)
            .textFieldStyle(.roundedBorder)
            .font(.jeHeader5)
            .foregroundColor(JEStudioColor.purple700)
            .padding(.bottom, 8)
          TextField("email", text: $username)
            .textFieldStyle(.roundedBorder)
            .font(.jeHeader5)
            .foregroundColor(JEStudioColor.purple700)
            .padding(.bottom, 8)
          TextField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
            .foregroundColor(JEStudioColor.purple700)
            .font(.jeHeader5)
            .padding(.top, 8)
        }
        .padding(.horizontal, 8)
        Spacer()
        Button("Sign up") {
          print("Hola")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(JEStudioColor.purple100)
        .background(JEStudioColor.purple500)
        .font(.jeHeader5)
      }
    }
    .addJENavBar(with: "Please Sign Up")
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
