//
//  JE_StudioApp.swift
//  JE Studio
//
//  Created by Daniel Martínez on 27/05/22.
//

import SwiftUI

@main
struct JE_StudioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: ViewRouter())
        }
    }
}
