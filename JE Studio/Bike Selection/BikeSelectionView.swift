//
//  BikeSelectionView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 14/07/22.
//

import SwiftUI

struct BikeSelectionView: View {
  @StateObject var viewModel: BikeSelectionViewModel
  @Binding var keepActive: Bool

  var body: some View {
    ScrollView {
      VStack {
        Text(BikeSelectionLocalizables.viewTitle)
          .font(.jeHeader4)
          .foregroundColor(JEStudioColor.purple600)
        SessionInfoCell(studio: viewModel.currentSession.studio.uppercased(),
                        date: viewModel.currentSession.getFormattedDate(),
                        hour: viewModel.currentSession.hour,
                        coach: viewModel.currentSession.coach)
        BikeGridView(viewModel: viewModel.getGridViewModel())
        Text("You've chosen bike \(viewModel.selectedBikeNumber)")
          .isHidden(viewModel.selectedBikeNumber == Int.zero)
          .font(.jeHeader5)
        Button(BikeSelectionLocalizables.confirmButtonLable) {
          viewModel.bookPlaceIn()
        }
        .padding()
        .allowsHitTesting(viewModel.selectedBikeNumber != Int.zero)
        .foregroundColor(viewModel.selectedBikeNumber != Int.zero ?  JEStudioColor.purple100 : .init(UIColor.systemGray3))
        .background(viewModel.selectedBikeNumber != Int.zero ?  JEStudioColor.purple500 : .init(UIColor.systemGray2))
        .font(.jeHeader6)
        .cornerRadius(8)
        Spacer()
      }
      .fullScreenCover(isPresented: $viewModel.shouldShowConfirmation,
             content: {
        ConfirmationView(keepActive: self.$keepActive,
                         bookedSession: viewModel.currentSession)
      })
      .addJENavBar(with: String())
    }
    .onAppear {
      viewModel.isDoubleBooking()
    }
    .alert("You already booked for this session", isPresented: $viewModel.alreadyBooked) {
      Button("Ok") {
        self.keepActive = false
      }
    }
  }
}

//struct BikeSelectionView_Previews: PreviewProvider {
//  static var previews: some View {
//    BikeSelectionView(viewModel: BikeSelectionViewModel(session: Session(studio: "Moderna", coach: "Laura", date: "25/05/2022", hour: "9:00", participants: ["daniel": 3])))
//  }
//}
