//
//  ContentView.swift
//  Admin
//
//  Created by Elín Ósk on 14.8.2024.
//

import SwiftUI

struct ContentView: View {

  @Binding var isLoggedIn: Bool

  var body: some View {
    NavigationStack {
      VStack {
        Image("Logo_Icon")
          .resizable()
          .frame(width: 150, height: 150)
        Text("Rafrænar Lausnir")
          .font(.title)
          .foregroundStyle(Color("text_color"))
        Text("Rafrænt handa öllum!")
          .font(.headline)
          .foregroundStyle(Color("text_color"))

        Spacer()

        NavigationLink {
          LoginView(isLoggedIn: $isLoggedIn)
        } label: {
          Text("Skrá inn")
            .padding()
            .padding(.horizontal)
            .foregroundStyle(Color("bg_color"))
            .bold()
            .background(Color("text_color"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }

      }
      .padding()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(
        Color("bg_color")
      )
    }
  }
}

#Preview {
  ContentView(isLoggedIn: .constant(false))
}
