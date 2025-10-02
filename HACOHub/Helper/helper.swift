//
//  helper.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

func getRGBColor(_ r: Int, _ g: Int, _ b: Int, _ a: Double = 1) -> Color {
  Color(.sRGB,
    red: Double(r) / 255.0,
    green: Double(g) / 255.0,
    blue: Double(b) / 255.0,
    opacity: a
  )
}

func getColumns(n: Int, spacing: CGFloat) -> [GridItem] {
  guard n > 0 else { return [] }

  return (0..<n).map { index in
    GridItem(
      .flexible(),
      spacing: index == n - 1 ? 0 : spacing
    )
  }
}
