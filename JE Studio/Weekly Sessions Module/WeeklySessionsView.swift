//
//  WeeklySessionsView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import SwiftUI

struct WeeklySessionsView: View {
  
  @ObservedObject var viewModel: WeeklySessionsViewModel
  
    var body: some View {
      ScrollView {
        ForEach(viewModel.availableSessions) { session in
          WeeklySessionsCell(sessionHour: session.hour,
                             availability: session.id,
                             coach: session.coach)
        }
      }
      .addJENavBar(with: "Available Sessions")
    }
}

struct WeeklySessionsView_Previews: PreviewProvider {
    static var previews: some View {
      WeeklySessionsView(viewModel: WeeklySessionsViewModel(for: .universidad))
    }
}
