//
//  BikeSelectionView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 14/07/22.
//

import SwiftUI

struct BikeSelectionView: View {
  
  @ObservedObject var viewModel: BikeSelectionViewModel
  
  var body: some View {
    VStack {
      Text(BikeSelectionLocalizables.viewTitle)
        .font(.jeHeader4)
        .foregroundColor(JEStudioColor.purple600)
      SessionInfoCell(studio: viewModel.currentSession.studio.uppercased(),
                      date: viewModel.currentSession.getFormattedDate(),
                      hour: viewModel.currentSession.hour,
                      coach: viewModel.currentSession.coach)
      BikeGridView(viewModel: viewModel.getGridViewModel())
      Text("You've chosen \(viewModel.selectedBikeNumber)")
        .isHidden(viewModel.selectedBikeNumber == Int.zero)
        .font(.jeHeader5)
      Button(BikeSelectionLocalizables.confirmButtonLable) {
        print("Hola")
      }
      .padding()
      .allowsHitTesting(viewModel.selectedBikeNumber != Int.zero)
      .foregroundColor(JEStudioColor.purple100)
      .background(JEStudioColor.purple500)
      .font(.jeHeader6)
      .cornerRadius(8)
      Spacer()
    }
    .addJENavBar(with: String())
  }
}

struct BikeSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    BikeSelectionView(viewModel: BikeSelectionViewModel(session: Session(studio: "Moderna", coach: "Laura", date: "25/05/2022", hour: "9:00", participants: ["daniel": 3])))
  }
}
