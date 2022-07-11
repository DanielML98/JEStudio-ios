//
//  JE_StudioApp.swift
//  JE Studio
//
//  Created by Daniel Martínez on 27/05/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct JE_StudioApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      ContentView(viewRouter: ViewRouter(), isLoggedIn: userIsLogged())
      //LoginView(viewModel: LoginViewModel())
    }
  }
  
  private func userIsLogged() -> Bool {
    return Auth.auth().currentUser != nil ? false : true
  }
}
