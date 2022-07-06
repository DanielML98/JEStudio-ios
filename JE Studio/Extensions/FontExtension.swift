//
//  FontExtension.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import Foundation
import SwiftUI

extension Font {
  static var jeHeader1: Font { return Font.custom("Montserrat-Light", size: 96) }
  static var jeHeader2: Font { return Font.custom("Montserrat-Light", size: 60) }
  static var jeHeader3: Font { return Font.custom("Montserrat-Regular", size: 48) }
  static var jeHeader4: Font { return Font.custom("Montserrat-Regular", size: 34) }
  static var jeHeader5: Font { return Font.custom("Montserrat-Regular", size: 24) }
  static var jeHeader6: Font { return Font.custom("Montserrat-Medium", size: 20) }
  static var jeSubtitle1: Font { return Font.custom("Montserrat-Regular", size: 16) }
  static var jeSubtitle2: Font { return Font.custom("Montserrat-Medium", size: 14) }
  static var jeBody1: Font { return Font.custom("Montserrat-Regular", size: 16) }
  static var jeBody2: Font { return Font.custom("Montserrat-Regular", size: 14) }
}
