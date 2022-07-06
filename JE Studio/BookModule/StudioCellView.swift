//
//  StudioCellView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import SwiftUI

struct StudioCellView: View {
  
  var studioName: String = "Universidad 54"
  var capacity: String = "7"
  
    var body: some View {
      HStack {
        Image(systemName: "house.fill")
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 90, height: 90, alignment: .center)
          .foregroundColor(JEStudioColor.purple300)
          .cornerRadius(8)
        VStack(alignment: .leading) {
          Text(studioName)
            .font(.jeHeader4)
            .foregroundColor(JEStudioColor.purple700)
          Text("Capacidad: \(capacity) bicicletas")
            .font(.jeSubtitle1)
            .foregroundColor(JEStudioColor.purple500)
        }
      }
    }
}

struct StudioCellView_Previews: PreviewProvider {
    static var previews: some View {
        StudioCellView()
    }
}
