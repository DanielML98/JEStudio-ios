//
//  WeeklySessionsCell.swift
//  JE Studio
//
//  Created by Daniel Martínez on 07/07/22.
//

import SwiftUI

struct WeeklySessionsCell: View {
  let sessionHour: String
  let date: String
  let coach: String

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(sessionHour)
          .font(.jeHeader4)
          .foregroundColor(JEStudioColor.purple700)
        Text(date)
          .font(.jeBody2)
          .foregroundColor(JEStudioColor.purple500)
      }
      Spacer()
      VStack {
        Text(Constants.coachLabel)
          .font(.jeSubtitle1)
        Image(systemName: Constants.coachImageIcon)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: Constants.imageDimensions, height: Constants.imageDimensions, alignment: .center)
          .foregroundColor(JEStudioColor.purple300)
          .cornerRadius(Constants.cornerRadius)
        Text(coach)
          .font(.jeSubtitle1)
      }
      Spacer()
      Image(systemName: Constants.chevronIconName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: Constants.chevronDimensions, height: Constants.chevronDimensions, alignment: .center)
        .foregroundColor(JEStudioColor.purple500)
    }
    .padding()
  }
  
  struct Constants {
    static var coachImageIcon: String { "person.fill" }
    static var coachLabel: String { "Coach" }
    static var chevronIconName: String { "chevron.right" }
    static var imageDimensions: CGFloat { 50.0 }
    static var chevronDimensions: CGFloat { 35.0 }
    static var cornerRadius: CGFloat { 8.0 }
  }
}

struct WeeklySessionsCell_Previews: PreviewProvider {
  static var previews: some View {
    WeeklySessionsCell(sessionHour: "7:00", date: "2", coach: "Laura")
  }
}
