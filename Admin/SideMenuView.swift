//
//  SideMenuView.swift
//  Admin
//
//  Created by Elín Ósk on 16.8.2024.
//

import SwiftUI

struct SideMenuView: View {

  @Binding var selectedSideMenuTab: Int
  @Binding var presentSidemenu: Bool

  var body: some View {
    HStack {
      ZStack {
        Rectangle()
          .fill(.white)
          .frame(width: 270)
          .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)

        VStack(alignment: .leading, spacing: 0) {
          ProfileImageView()
            .frame(height: 140)
            .padding(.bottom, 30)

          ForEach(SideMenuRowType.allCases, id: \.self) { row in
            RowView(
              isSelected: selectedSideMenuTab == row.rawValue,
              imageName: row.iconName,
              title: row.title
            ) {
              selectedSideMenuTab = row.rawValue
              presentSidemenu.toggle()
            }
          }
          Spacer()
        }
        .padding(.top, 100)
        .frame(width: 270)
        .background(Color.white)
      }
      Spacer()
    }
    .background(Color.clear)
  }

  func ProfileImageView() -> some View {
    VStack(alignment: .center) {
      HStack {
        Spacer()
        Image("Logo_Icon")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 100, height: 100)
          .overlay(
            RoundedRectangle(cornerRadius: 50)
              .stroke(.purple.opacity(0.5), lineWidth: 10)
          )
          .clipShape(RoundedRectangle(cornerRadius: 50))
        Spacer()
      }
      Text("Elin Osk")
        .font(.system(size: 18, weight: .bold))
        .foregroundStyle(Color.black)

      Text("IOS Developer")
        .font(.system(size: 14, weight: .semibold))
        .foregroundStyle(Color.black.opacity(0.5))
    }
  }

  func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (() -> ())) -> some View {
    Button {
      action()
    } label: {
      VStack(alignment: .leading) {
        HStack(spacing: 20) {
          Rectangle()
            .fill(isSelected ? .purple : .white)
            .frame(width: 5)

          ZStack {
            Image(imageName)
              .resizable()
              .renderingMode(.template)
              .foregroundStyle(isSelected ? Color.black : Color.gray)
              .frame(width: 26, height: 26)
          }
          .frame(width: 30, height: 30)
          Text(title)
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(isSelected ? Color.black : Color.gray)
          Spacer()
        }
      }
    }
    .frame(height: 50)
    .background(
      LinearGradient(
        colors: [isSelected ? .purple.opacity(0.5) : .white, .white],
        startPoint: .leading,
        endPoint: .trailing
      )
    )
  }
}

#Preview {
  SideMenuView(selectedSideMenuTab: .constant(0), presentSidemenu: .constant(true))
}
