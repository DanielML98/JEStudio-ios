//
//  ViewRouter.swift
//  JE Studio
//
//  Created by Daniel Martínez on 27/05/22.
//

import SwiftUI

enum Page {
  case profile
  case book
  case payments
}

class ViewRouter: ObservableObject {
  @Published var currentPage: Page = .book
}

