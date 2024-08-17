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
    let user = FirebaseAuthManager.shared.fetchSignedInUser()
    if let user = user {
      TmpStorage.shared.user = Usr(user)
    }
    self.isLoggedIn = user != nil
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
