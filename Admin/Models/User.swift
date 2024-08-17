//
//  User.swift
//  Admin
//
//  Created by Elín Ósk on 17.8.2024.
//

import Foundation
import FirebaseAuth

struct Usr {
  let uid: String
  let email: String?
  let photoUrl: String?

  init(_ user: User) {
    self.uid = user.uid
    self.email = user.email
    self.photoUrl = user.photoURL?.absoluteString
  }
}
