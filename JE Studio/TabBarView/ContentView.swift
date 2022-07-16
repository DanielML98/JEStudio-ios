//
//  ContentView.swift
//  JE Studio
//
//  Created by Daniel Martínez on 27/05/22.
//

import SwiftUI

struct ContentView: View {
  
  private let localizables: TabBarLocalizables = TabBarLocalizables()
  @StateObject var viewRouter: ViewRouter
  @State var isLoggedIn: Bool

    var body: some View {
      GeometryReader { geometry in
        VStack {
          Spacer()
          switch viewRouter.currentPage {
          case .profile:
            ProfileView(isLoggedIn: self.$isLoggedIn)
          case .book:
              BookView(viewModel: BookViewModel())
          case .payments:
              Text("Payments")
          }
          Spacer()
          HStack {
            TabBarIcon(viewRouter: viewRouter,
                       assignedPage: .profile,
                       width: geometry.size.width/JEConstants.mainTabBarItemCount,
                       height: geometry.size.height/JEConstants.tabBarIconHeightRatio,
                       systemIconName: JEConstants.personIconName,
                       tabName: localizables.profileLabel)
            TabBarIcon(viewRouter: viewRouter,
                       assignedPage: .book,
                       width: geometry.size.width/JEConstants.mainTabBarItemCount,
                       height: geometry.size.height/JEConstants.tabBarIconHeightRatio,
                       systemIconName: JEConstants.bookIconName,
                       tabName: localizables.bookLabel)
            TabBarIcon(viewRouter: viewRouter,
                       assignedPage: .payments,
                       width: geometry.size.width/JEConstants.mainTabBarItemCount,
                       height: geometry.size.height/JEConstants.tabBarIconHeightRatio,
                       systemIconName: JEConstants.dollarIconName,
                       tabName: localizables.paymentsLabel)
          }
          .foregroundColor(JEStudioColor.purple200)
          .frame(width: geometry.size.width, height: geometry.size.height/JEConstants.mainTabBarHeight)
          .background(JEStudioColor.purple500)
        }
      }
      .fullScreenCover(isPresented: $isLoggedIn) {
        LoginView(viewModel: LoginViewModel(), isLoggedIn: self.$isLoggedIn)
      }
    }
}

struct TabBarIcon: View {
  @StateObject var viewRouter: ViewRouter
  let assignedPage: Page
  let width, height: CGFloat
  let systemIconName, tabName: String
  
  var body: some View {
    VStack {
      Image(systemName: systemIconName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: width, height: height)
        .padding(.top, JEConstants.mainTabBarIconPadding)
      Text(tabName)
        .font(.footnote)
      Spacer()
    }
    .onTapGesture {
      viewRouter.currentPage = assignedPage
    }
    .foregroundColor(viewRouter.currentPage == assignedPage ? JEStudioColor.purple700 : JEStudioColor.purple200)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(viewRouter: ViewRouter(), isLoggedIn: true)
    }
}

