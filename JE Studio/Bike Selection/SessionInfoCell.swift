//
//  SessionInfoCell.swift
//  JE Studio
//
//  Created by Daniel Martínez on 13/07/22.
//

import SwiftUI

struct SessionInfoCell: View {
  
  let studio: String
  let date: String
  let hour: String
  let coach: String
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(studio)
          .font(.jeHeader4)
          .foregroundColor(JEStudioColor.purple700)
        Text(date)
          .font(.jeSubtitle1)
          .foregroundColor(.black)
        Text(hour)
          .font(.jeSubtitle1)
          .foregroundColor(JEStudioColor.purple700)
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
    }
    .padding()
  }
}

struct SessionInfoCell_Previews: PreviewProvider {
  static var previews: some View {
    SessionInfoCell(studio: "Moderna",
                    date: "Domingo 27 de enero",
                    hour: "21:00",
                    coach: "Laura")
  }
}
