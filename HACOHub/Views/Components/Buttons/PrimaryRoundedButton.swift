//
//  RoundedButton.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI

struct WhiteRoundedButton: View {
  let text: String
  let color: Color
  let weight: FontWeight
  let size: CGFloat
  let vPadding: CGFloat
  let radius: CGFloat
  let action: () -> Void

  var body: some View {
    Button {
      action()
    } label: {
      Group {
        switch weight {
        case .regular:
          Text.sfProRegular(text, size: size)
        case .medium:
          Text.sfProMedium(text, size: size)
        case .semiBold:
          Text.sfProSemiBold(text, size: size)
        case .bold:
          Text.sfProBold(text, size: size)
        }
      }
        .foregroundColor(color)
        .padding(.vertical, vPadding)
        .frame(maxWidth: .infinity)
        .background(.white)
        .overlay(
          RoundedRectangle(cornerRadius: radius)
            .stroke(getRGBColor(66, 74, 83), lineWidth: 1)
        )
        .cornerRadius(radius)
    }
  }
}

struct PrimaryRoundedButton: View {
  let text: String
  let weight: FontWeight
  let size: CGFloat
  let vPadding: CGFloat
  let radius: CGFloat
  let action: () -> Void

  var body: some View {
    Button {
      action()
    } label: {
      Group {
        switch weight {
        case .regular:
          Text.sfProRegular(text, size: size)
        case .medium:
          Text.sfProMedium(text, size: size)
        case .semiBold:
          Text.sfProSemiBold(text, size: size)
        case .bold:
          Text.sfProBold(text, size: size)
        }
      }
        .foregroundColor(.white)
        .padding(.vertical, vPadding)
        .frame(maxWidth: .infinity)
        .background(getRGBColor(79, 190, 159))
        .cornerRadius(radius)
    }
  }
}

#Preview {
  VStack {
    WhiteRoundedButton(
      text: "test",
      color: .black,
      weight: .regular,
      size: 20,
      vPadding: 20,
      radius: 16,
      action: {}
    )
    PrimaryRoundedButton(
      text: "test",
      weight: .bold,
      size: 20,
      vPadding: 20,
      radius: 16,
      action: {}
    )
  }
}
