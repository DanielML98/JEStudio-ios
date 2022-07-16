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
      Button("Log out") {
        AuthenticationManager.logOut()
        isLoggedIn.toggle()
      }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
      ProfileView(isLoggedIn: .constant(true))
    }
}
