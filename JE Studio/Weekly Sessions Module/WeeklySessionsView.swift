//
//  WeeklySessionsView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import SwiftUI

struct WeeklySessionsView: View {
  
  @ObservedObject var viewModel: WeeklySessionsViewModel
  @State var goToBikeSelection: Bool = false
  @Binding var keepActive: Bool
  let localizables = WeeklySessionsLocalizables()
  
    var body: some View {
      ScrollView {
        NavigationLink(isActive: $goToBikeSelection) {
          BikeSelectionView(viewModel: viewModel.getBikeSelectionModel(), keepActive: $keepActive)
        } label: {
          EmptyView()
        }
        .isDetailLink(false)
        switch viewModel.state {
        case .loading:
          ProgressView()
        case .success:
          ForEach(viewModel.availableSessions) { session in
            WeeklySessionsCell(sessionHour: session.hour,
                               date: session.getFormattedDate(),
                               coach: session.coach)
            .onTapGesture {
              viewModel.updateSelection(to: session)
              self.goToBikeSelection = true
            }
          }
        case .failure:
          Text("Couldn't fetch the data")
        }
      }
      .addJENavBar(with: localizables.navBarTitle)
      .onAppear {
        viewModel.getSessions()
      }
    }
}

//struct WeeklySessionsView_Previews: PreviewProvider {
//    static var previews: some View {
//      WeeklySessionsView(viewModel: WeeklySessionsViewModel(for: .universidad), keepActive: Binding<false>)
//    }
//}
