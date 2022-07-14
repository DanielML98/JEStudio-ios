//
//  BikeGridView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 11/07/22.
//

import SwiftUI

struct BikeGridView: View {
  @ObservedObject var viewModel: BikeGridViewModel
  var body: some View {
    HStack(spacing: 64) {
      VStack {
        ForEach(viewModel.backRow) { bike in
          BikeButton(viewModel: self.viewModel,
                     bikeNumber: bike.bikeNumber,
                     isTaken: bike.isTaken,
                     isSelected: bike.isSelected)
        }
      }
      VStack {
        ForEach(viewModel.frontRow) { bike in
          BikeButton(viewModel: self.viewModel,
                     bikeNumber: bike.bikeNumber,
                     isTaken: bike.isTaken,
                     isSelected: bike.isSelected)
        }
      }
      Text(BikeSelectionLocalizables.mirrorLabel)
          .rotationEffect(.degrees(90))
          .fixedSize()
          .frame(width: 20, height: 180)
          .font(.jeHeader3)
    }
  }
  
  struct BikeButton: View {
    let viewModel: BikeGridViewModel
    let bikeNumber: Int
    let isTaken: Bool
    let isSelected: Bool
    
    var body: some View {
      Button {
        viewModel.selectBike(bikeNumber)
      } label: {
        Image("spinning.bike")
          .renderingMode(.template)
          .resizable()
          .foregroundColor(getBikeColor())
          .frame(width: 50, height: 50)
      }
      .allowsHitTesting(!isTaken)
    }
    
    func getBikeColor() -> Color {
      guard !isSelected else { return JEStudioColor.purple600 }
      return isTaken ? Color.red : Color.black
    }
  }
}

struct BikeGridView_Previews: PreviewProvider {
  static var previews: some View {
    BikeGridView(viewModel: BikeGridViewModel(participants: ["Daniel":1, "daniel": 6, "daniel2": 8]))
  }
}
