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

  @State private var isLoggedIn: Bool

  init() {
    FirebaseApp.configure()
    self.isLoggedIn = FirebaseAuthManager.shared.fetchSignedInUser() != nil
  }

  var body: some Scene {
    WindowGroup {
      if isLoggedIn {
        MainTabbedView(isLoggedIn: $isLoggedIn)
      } else {
        ContentView(isLoggedIn: $isLoggedIn)
      }
    }
  }
}
