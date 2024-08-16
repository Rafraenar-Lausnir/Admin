//
//  SettingsView.swift
//  Admin
//
//  Created by Elín Ósk on 16.8.2024.
//

import SwiftUI

struct SettingsView: View {

  @Binding var presentSideMenu: Bool

  var body: some View {
    VStack {
      HStack {
        Button {
          presentSideMenu.toggle()
        } label: {
          Image(systemName: "line.3.horizontal")
            .resizable()
            .frame(width: 32, height: 32)
        }
        Spacer()
      }
      Spacer()
      Text("Settings View")
      Spacer()
    }
    .padding(.horizontal, 24)
  }
}

#Preview {
  SettingsView(presentSideMenu: .constant(false))
}
