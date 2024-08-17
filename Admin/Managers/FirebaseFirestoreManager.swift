//
//  FirebaseFirestoreManager.swift
//  Admin
//
//  Created by Elín Ósk on 17.8.2024.
//

import Foundation
import FirebaseFirestore

final class FirebaseFirestoreManager {
  static let shared = FirebaseFirestoreManager()
  private init() {}

  let db = Firestore.firestore()
}

// MARK: - User Management
extension FirebaseFirestoreManager {
  func createNewUser(for user: Usr) async throws {
    var newUser: [String: Any] = [
      "user_id": user.uid,
      "date_created": Timestamp(),
      "date_updated": Timestamp()
    ]
    if let email = user.email {
      newUser["email"] = email
    }
    if let photoUrl = user.photoUrl {
      newUser["photo_url"] = photoUrl
    }
    try await db.collection("users").document(user.uid).setData(newUser, merge: false)
  }
}
