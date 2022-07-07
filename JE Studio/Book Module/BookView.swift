//
//  BookView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 05/07/22.
//

import SwiftUI

struct BookView: View {
  @ObservedObject var viewModel: BookViewModel
  @State var selectedStudio: Studio = Studio(name: "Universidad 54", capacity: "7")
  @State var navigationAction: Int? = 0
  
    var body: some View {
      NavigationView {
        VStack (alignment: .leading) {
          NavigationLink(tag: 1, selection: $navigationAction) {
            WeeklySessionsView()
          } label: {
            EmptyView()
          }
          Text(viewModel.viewTitle)
            .foregroundColor(JEStudioColor.purple700)
            .font(.jeHeader2)
            .overlay {
              Rectangle()
                .fill(JEStudioColor.purple300)
                .frame(width: 200, height: 1)
                .offset(x: 0, y: 30)
            }
          ForEach(viewModel.studios) { studio in
            StudioCellView(studioName: studio.name, capacity: studio.capacity)
              .onTapGesture {
                self.selectedStudio = studio
                self.navigationAction = 1
              }
          }
          Spacer()
        }
        .navigationBarHidden(true)
      }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(viewModel: BookViewModel())
    }
}
