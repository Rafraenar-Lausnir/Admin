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

  private let db: Firestore
  private let userCollection: CollectionReference

  private init() {
    db = Firestore.firestore()
    userCollection = db.collection("users")
  }
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
    try await userCollection.document(user.uid).setData(newUser, merge: false)
  }

  func fetchUser(for userId: String) async throws -> Usr {
    let snapshot = try await userCollection.document(userId).getDocument()

    guard let data = snapshot.data(), let userId = data["user_id"] as? String else {
      throw URLError(.badServerResponse)
    }

    let email = data["email"] as? String
    let photoUrl = data["photo_url"] as? String
    let dateCreated = data["date_created"] as? Date
    let dateUpdated = data["date_updated"] as? Date

    let user = Usr(
      id: userId,
      email: email,
      photoUrl: photoUrl,
      dateCreated: dateCreated,
      dateUpdated: dateUpdated
    )
    return user
  }
}
