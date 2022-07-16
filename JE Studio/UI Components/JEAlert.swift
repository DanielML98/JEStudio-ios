//
//  JEAlert.swift
//  JE Studio
//
//  Created by Daniel Martínez on 17/07/22.
//

import SwiftUI

struct JEAlert: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  let title: String
  let message: String
  
    var body: some View {
      ZStack {
        Color(uiColor: .darkGray)
          .opacity(0.8)
          .ignoresSafeArea(
          )
        VStack (alignment: .leading) {
          VStack() {
            Text(title)
              .font(.jeHeader3)
              .foregroundColor(JEStudioColor.purple500)
            Text(message)
              .font(.jeBody1)
          }
          .frame(maxWidth: .infinity)
          .padding(.horizontal)
          HStack{
            Button("Okay") {
              presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(JEStudioColor.purple100)
            .font(.jeHeader5)
            .padding(.vertical, 10)
          }
          .frame(maxWidth: .infinity)
          .background(JEStudioColor.purple500)
        }
        .frame(minHeight: 200)
        .background()
        .padding(.horizontal)
      }
    }
}

struct JEAlert_Previews: PreviewProvider {
    static var previews: some View {
      JEAlert(title: "Error", message: "Parece que algo salió mal")
    }
}
