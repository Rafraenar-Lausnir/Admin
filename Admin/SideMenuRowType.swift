//
//  SideMenuRowType.swift
//  Admin
//
//  Created by Elín Ósk on 16.8.2024.
//

import Foundation

enum SideMenuRowType: Int, CaseIterable {
  case home = 0
  case settings

  var title: String{
    switch self {
    case .home:
      return "Heim"
    case .settings:
      return "Stillingar"
    }
  }

  var iconName: String{
    switch self {
    case .home:
      return "home"
    case .settings:
      return "settings"
    }
  }
}
