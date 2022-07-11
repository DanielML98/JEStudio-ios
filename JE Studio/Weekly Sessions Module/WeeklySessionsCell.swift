//
//  WeeklySessionsCell.swift
//  JE Studio
//
//  Created by Daniel Martínez on 07/07/22.
//

import SwiftUI

struct WeeklySessionsCell: View {
  let sessionHour: String
  let availability: String
  let coach: String

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(sessionHour)
          .font(.jeHeader4)
          .foregroundColor(JEStudioColor.purple700)
        Text("\(availability) bikes free")
          .font(.jeBody2)
          .foregroundColor(JEStudioColor.purple500)
      }
      Spacer()
      VStack {
        Text("Coach")
          .font(.jeSubtitle1)
        Image(systemName: "person.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50, height: 50, alignment: .center)
          .foregroundColor(JEStudioColor.purple300)
          .cornerRadius(8)
        Text(coach)
          .font(.jeSubtitle1)
      }
      Spacer()
      Image(systemName: "chevron.right")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 35, height: 35, alignment: .center)
        .foregroundColor(JEStudioColor.purple500)
    }
    .padding()
  }
}

struct WeeklySessionsCell_Previews: PreviewProvider {
  static var previews: some View {
    WeeklySessionsCell(sessionHour: "7:00", availability: "2", coach: "Laura")
  }
}
