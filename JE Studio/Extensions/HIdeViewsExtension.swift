//
//  HIdeViewsExtension.swift
//  JE Studio
//
//  Created by Daniel Martínez on 14/07/22.
//

import Foundation
import SwiftUI

extension View {
  @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
    if hidden {
      if !remove {
        self.hidden()
      }
    } else {
      self
    }
  }
}
