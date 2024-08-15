//
//  AdminApp.swift
//  Admin
//
//  Created by Elín Ósk on 14.8.2024.
//

import SwiftUI
import FirebaseCore

@main
struct AdminApp: App {

  @State private var isLoggedIn: Bool = false

  init() {
    FirebaseApp.configure()
  }
  var body: some Scene {
    WindowGroup {
      if isLoggedIn {
        HomeView()
          .transition(.move(edge: .trailing))
      } else {
        ContentView()
          .transition(.move(edge: .leading))
      }
    }
  }
}
