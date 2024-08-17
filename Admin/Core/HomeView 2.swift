//
//  HomeView.swift
//  Admin
//
//  Created by Elín Ósk on 15.8.2024.
//

import SwiftUI

struct HomeView: View {

  @Binding var presentSideMenu: Bool
  let user = TmpStorage.shared.user

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
      List {
        if let user = user {
          Text("Signed in user: \(user.uid)")
        }
      }
      Spacer()
    }
    .padding(.horizontal, 24)
  }
}

#Preview {
  HomeView(presentSideMenu: .constant(true))
}
