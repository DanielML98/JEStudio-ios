//
//  String+Localizable.swift
//  JE Studio
//
//  Created by Daniel Martínez on 30/05/22.
//

import Foundation

extension String {
  var jeLocalized: String {
    NSLocalizedString(self, comment: "")
  }
}
