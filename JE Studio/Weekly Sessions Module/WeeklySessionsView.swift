//
//  WeeklySessionsView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import SwiftUI

struct WeeklySessionsView: View {
  
  @ObservedObject var viewModel: WeeklySessionsViewModel
  @State var navigationAction: Int? = 0
  let localizables = WeeklySessionsLocalizables()
  
    var body: some View {
      ScrollView {
        NavigationLink(tag: 1, selection: $navigationAction) {
          BikeSelectionView(viewModel: viewModel.getBikeSelectionModel())
        } label: {
          EmptyView()
        }
        ForEach(viewModel.availableSessions) { session in
          WeeklySessionsCell(sessionHour: session.hour,
                             date: session.getFormattedDate(),
                             coach: session.coach)
          .onTapGesture {
            viewModel.updateSelection(to: session)
            navigationAction = 1
          }
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
