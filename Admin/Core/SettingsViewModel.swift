//
//  SettingsViewModel.swift
//  Admin
//
//  Created by Elín Ósk on 17.8.2024.
//

import Foundation

final class SettingsViewModel: ObservableObject {

  func signout() throws {
    try FirebaseAuthManager.shared.signOut()
  }

}
