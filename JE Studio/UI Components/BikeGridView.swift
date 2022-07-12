//
//  BikeGridView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 11/07/22.
//

import SwiftUI

struct BikeGridView: View {
  let data: [Int] = Array(0...3)
  @ObservedObject var viewModel: BikeGridViewModel
  var body: some View {
    HStack(spacing: 64) {
      VStack {
        ForEach(viewModel.backRow) { bike in
          bikeButton
            .foregroundColor(bike.isTaken ? Color.red : Color.black)
        }
      }
      VStack {
        ForEach(viewModel.frontRow) { bike in
          bikeButton
            .foregroundColor(bike.isTaken ? Color.red : Color.black)
        }
      }
      Text("Mirror")
          .rotationEffect(.degrees(90))
          .fixedSize()
          .frame(width: 20, height: 180)
          .font(.jeHeader3)
    }
  }
}

var bikeButton: some View {
  Button {
    print("Hola Mundo")
  } label: {
    Image("spinning.bike")
      .renderingMode(.template)
      .resizable()
      .frame(width: 50, height: 50)
  }
}

struct BikeGridView_Previews: PreviewProvider {
  static var previews: some View {
    BikeGridView(viewModel: BikeGridViewModel(participants: ["Daniel":1, "daniel": 6, "daniel2": 8]))
  }
}
