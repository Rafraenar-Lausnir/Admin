//
//  HomeView.swift
//  Admin
//
//  Created by Elín Ósk on 15.8.2024.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    Button {
      try? FirebaseAuthManager.shared.signOut()
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
  HomeView()
}
