//
//  WeeklySessionsCell.swift
//  JE Studio
//
//  Created by Daniel Martínez on 07/07/22.
//

import SwiftUI

struct WeeklySessionsCell: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text("7:00-8:00")
          .font(.jeHeader4)
          .foregroundColor(JEStudioColor.purple700)
        Text("Capacidad:bicicletas")
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
        Text("Laura")
          .font(.jeSubtitle1)
      }
      Spacer()
      Image(systemName: "chevron.right")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 35, height: 35, alignment: .center)
        .foregroundColor(JEStudioColor.purple500)
        .cornerRadius(8)
    }
    .padding()
  }
}

struct WeeklySessionsCell_Previews: PreviewProvider {
  static var previews: some View {
    WeeklySessionsCell()
  }
}
