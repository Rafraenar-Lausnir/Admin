//
//  MainTabbedView.swift
//  Admin
//
//  Created by Elín Ósk on 16.8.2024.
//

import SwiftUI

struct MainTabbedView: View {

  @State var presentSideMenu = false
  @State var selectedSideMenuTab = 0

  var body: some View {
    ZStack {
      TabView(selection: $selectedSideMenuTab) {
        HomeView(presentSideMenu: $presentSideMenu)
          .tag(0)
        SettingsView(presentSideMenu: $presentSideMenu)
          .tag(1)
      }

      SideMenu(
        isShowing: $presentSideMenu,
        content: AnyView(
          SideMenuView(
            selectedSideMenuTab: $selectedSideMenuTab,
            presentSidemenu: $presentSideMenu
          )
        )
      )
    }
  }
}

#Preview {
  MainTabbedView()
}
