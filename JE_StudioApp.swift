//
//  JE_StudioApp.swift
//  JE Studio
//
//  Created by Daniel Martínez on 27/05/22.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    ConnectionValidator.shared.startMonitoring()
    return true
  }
}

@main
struct JE_StudioApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @Environment(\.scenePhase) private var scenePhase
  @State var stillHasInternetConnection: Bool = false
  var body: some Scene {
    WindowGroup {
        ContentView(viewRouter: ViewRouter(), isLoggedIn: userIsLogged())
          .fullScreenCover(isPresented: $stillHasInternetConnection) {
            JEAlert(title: CustomErrors.notConnectedToInternet.title, message: CustomErrors.notConnectedToInternet.message)
          }
    }
    .onChange(of: scenePhase) { newValue in
      if newValue == .active {
        stillHasInternetConnection = !ConnectionValidator.shared.userHasConnection
      }
    }
  }
  
  private func userIsLogged() -> Bool {
    return AuthenticationManager.getCurrentUser() != nil ? false : true
  }
  
  private func userHasConnection() -> Bool {
    ConnectionValidator.shared.userHasConnection
  }
}
