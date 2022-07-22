//
//  BookViewModel.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import Foundation

final class BookViewModel: ObservableObject {
  var studios: [Studio] = [Studio(name: BookLocalizables.universidadStudioLabel, capacity: BookLocalizables.commonCapacity),
                           Studio(name: BookLocalizables.modernaStudioLable, capacity: BookLocalizables.commonCapacity)]
  var viewTitle: String { return BookLocalizables.viewTitle }
}

