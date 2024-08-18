//
//  HomeView.swift
//  Admin
//
//  Created by Elín Ósk on 15.8.2024.
//

import SwiftUI

struct HomeView: View {

  @Binding var isLoggedIn: Bool

  var body: some View {
    Button {
      do {
        try FirebaseAuthManager.shared.signOut()
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
  }
}

#Preview {
  HomeView(isLoggedIn: .constant(true))
}
