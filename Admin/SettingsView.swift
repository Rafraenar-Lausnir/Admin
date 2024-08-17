//
//  SettingsView.swift
//  Admin
//
//  Created by Elín Ósk on 16.8.2024.
//

import SwiftUI

struct SettingsView: View {

  @StateObject private var vm = SettingsViewModel()
  @Binding var presentSideMenu: Bool
  @Binding var isLoggedIn: Bool

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
      Button {
        Task {
          do {
            try await FirebaseAuthManager.shared
              .createUser(for: "testing@testing.com")
          } catch let err {
            print("Error logging out: \(err.localizedDescription)")
          }
        }
      } label: {
        Text("Búa til lykilorð")
          .padding()
          .padding(.horizontal)
          .foregroundStyle(Color("bg_color"))
          .bold()
          .background(Color("text_color"))
          .clipShape(RoundedRectangle(cornerRadius: 10))
      }
      Button {
        do {
          try vm.signout()
          isLoggedIn = false
        } catch let err {
          print("Error logging out: \(err.localizedDescription)")
        }
      } label: {
        Text("Skrá út")
          .padding()
          .padding(.horizontal)
          .foregroundStyle(Color("bg_color"))
          .bold()
          .background(Color("text_color"))
          .clipShape(RoundedRectangle(cornerRadius: 10))
      }

      Spacer()
    }
    .padding(.horizontal, 24)
  }
}

#Preview {
  SettingsView(presentSideMenu: .constant(false), isLoggedIn: .constant(true))
}
