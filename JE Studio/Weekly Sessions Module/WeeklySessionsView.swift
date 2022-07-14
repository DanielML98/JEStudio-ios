//
//  WeeklySessionsView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import SwiftUI

struct WeeklySessionsView: View {
  
  @ObservedObject var viewModel: WeeklySessionsViewModel
  let localizables = WeeklySessionsLocalizables()
  
    var body: some View {
      ScrollView {
        ForEach(viewModel.availableSessions) { session in
          WeeklySessionsCell(sessionHour: session.hour,
                             date: session.getFormattedDate(),
                             coach: session.coach)
        }
      }
      .addJENavBar(with: localizables.navBarTitle)
    }
}

struct WeeklySessionsView_Previews: PreviewProvider {
    static var previews: some View {
      WeeklySessionsView(viewModel: WeeklySessionsViewModel(for: .universidad))
    }
}
