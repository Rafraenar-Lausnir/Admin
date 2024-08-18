//
//  User.swift
//  Admin
//
//  Created by Elín Ósk on 17.8.2024.
//

import Foundation
import FirebaseAuth

struct Usr: Codable {
  let uid: String
  let email: String?
  let photoUrl: String?
  let dateCreated: Date?
  let dateUpdated: Date?

  init(_ user: User) {
    self.uid = user.uid
    self.email = user.email
    self.photoUrl = user.photoURL?.absoluteString
    self.dateCreated = Date()
    self.dateUpdated = Date()
  }

  init(id: String, email: String?, photoUrl: String?, dateCreated: Date?, dateUpdated: Date?) {
    self.uid = id
    self.email = email
    self.photoUrl = photoUrl
    self.dateCreated = dateCreated
    self.dateUpdated = dateUpdated
  }
}
