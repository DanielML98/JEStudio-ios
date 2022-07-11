//
//  JENavigationBar.swift
//  JE Studio
//
//  Created by Daniel Martínez on 09/07/22.
//

import Foundation
import SwiftUI

struct JENavigationBar: ViewModifier {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  let navBarTitle: String
  
  func body(content: Content) -> some View {
    content
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text(navBarTitle)
            .font(.jeHeader5)
            .foregroundColor(JEStudioColor.purple700)
        }
        ToolbarItem(placement: .navigationBarLeading) {
          Image(systemName: "chevron.left")
            .resizable()
            .frame(width: 10, height: 20)
            .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 50))
            .foregroundColor(JEStudioColor.purple600)
            .onTapGesture {
              presentationMode.wrappedValue.dismiss()
            }
        }
      }
  }
}

extension View {
  func addJENavBar(with title: String) -> some View {
    modifier(JENavigationBar(navBarTitle: title))
  }
}
