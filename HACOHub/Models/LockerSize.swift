//
//  LockerSize.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/07.
//

import SwiftUI

enum LockerSize: String {
  case small = "Small"
  case medium = "Medium"
  case large = "Large"

  static func fromText(_ text: String) -> LockerSize? {
    let lower = text.lowercased()
    if lower.contains("small") { return .small }
    if lower.contains("medium") { return .medium }
    if lower.contains("large") { return .large }
    return nil
  }

  var price: String {
    switch self {
    case .small: return "$5"
    case .medium: return "$8"
    case .large: return "$12"
    }
  }
}

let sizeButtons: [RadioButton] = [
  RadioButton(text: "Small\n$5"),
  RadioButton(text: "Medium\n$8"),
  RadioButton(text: "Large\n$12"),
]
