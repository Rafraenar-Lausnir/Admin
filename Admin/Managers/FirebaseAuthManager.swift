//
//  FirebaseAuthManager.swift
//  Admin
//
//  Created by Elín Ósk on 15.8.2024.
//

import Foundation
import FirebaseAuth

final class FirebaseAuthManager {
  static let shared = FirebaseAuthManager()
  private let auth = Auth.auth()

  private init() {
    self.auth.languageCode = "is"
  }

  private func reauthenticateUser(with credential: AuthCredential) async throws -> User {
    guard let user = fetchSignedInUser() else {
      throw URLError(.unknown)
    }
    return try await user.reauthenticate(with: credential).user
  }

  func fetchSignedInUser() -> User? {
    return auth.currentUser
  }

  func signIn(via email: String, with password: String) async throws {
    let authDataResult = try await auth.signIn(withEmail: email, password: password)
  }

  func reauthenticateUser(via email: String, with password: String) async throws -> AuthCredential {
    let authDataResult = try await auth.signIn(
      withEmail: email,
      password: password
    )
    if let credential = authDataResult.credential {
      return credential
    } else {
      throw URLError(.unknown)
    }
  }

  func signOut() throws {
    try auth.signOut()
  }

  func resetPassword(_ credential: AuthCredential, to newPassword: String) async throws {
    let user = try await self.reauthenticateUser(with: credential)
    try await user.updatePassword(to: newPassword)
  }

  func updateEmail(_ credential: AuthCredential, to newEmail: String) async throws {
    let user = try await self.reauthenticateUser(with: credential)
    try await user.sendEmailVerification(beforeUpdatingEmail: newEmail)
  }

  func sendEmailVerification(_ credential: AuthCredential) async throws {
    let user = try await self.reauthenticateUser(with: credential)
    try await user.sendEmailVerification()
  }
}
