//
//  SquareIconButton.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/05.
//

import SwiftUI

struct SquareIconButton: View {
  let iconName: String
  let length: CGFloat
  let action: () -> Void

  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        Rectangle()
          .fill(Color.white)
          .cornerRadius(8)
          .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)

        Image(iconName)
          .resizable()
          .scaledToFit()
          .padding(8)
          .foregroundColor(getRGBColor(79, 190, 159))
      }
      .frame(width: length, height: length)
    }
  }
}

#Preview {
  SquareIconButton(iconName: "HomeIcon", length: 46, action: {})
}
