//
//  ProfileView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 17/07/22.
//

import SwiftUI

struct ProfileView: View {
  @Binding var isLoggedIn: Bool
  var body: some View {
    VStack() {
      Image("je-logo")
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .aspectRatio(1/2, contentMode: .fit)
        .foregroundColor(JEStudioColor.purple500)
        .overlay(Circle().stroke(JEStudioColor.purple600, lineWidth: 5))
      Text("Daniel Martinez")
        .font(.jeHeader4)
        .foregroundColor(JEStudioColor.purple500)
      //Spacer()
      VStack(alignment: .leading , spacing: 16) {
        Text("Settings")
          .foregroundColor(.white)
          .font(.jeHeader2)
        ScrollView {
          settingsCell
          Spacer()
        }
      }
      .frame(maxWidth: .infinity)
      .padding(8)
      .background(JEStudioColor.purple500, ignoresSafeAreaEdges: .bottom)
    }
  }
  
  var settingsCell: some View {
    VStack(alignment: .leading, spacing: 16) {
      Button("My classes") {
        print("Settings")
      }
      .frame(maxWidth: .infinity)
      .background(.white)
      .font(.jeHeader4)
      .clipShape(Capsule())
      Button("Settings") {
        print("Settings")
      }
      .frame(maxWidth: .infinity)
      .background(.white)
      .font(.jeHeader4)
      .clipShape(Capsule())
      Button("Notifications") {
        print("Settings")
      }
      .frame(maxWidth: .infinity)
      .background(.white)
      .font(.jeHeader4)
      .clipShape(Capsule())
      Button("Log out") {
        AuthenticationManager.logOut()
        isLoggedIn.toggle()
      }
      .frame(maxWidth: .infinity)
      .background(.white)
      .font(.jeHeader4)
      .foregroundColor(.red)
      .clipShape(Capsule())
      .padding(.vertical)
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView(isLoggedIn: .constant(true))
  }
}
