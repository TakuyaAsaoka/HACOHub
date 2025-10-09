//
//  PrimaryRoundedButton.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI

struct PrimaryRoundedButton: View {
  let text: String
  let action: () -> Void

  var body: some View {
    Button {
      action()
    } label: {
      Text.sfProBold(text, size: 20)
        .foregroundColor(.white)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background(getRGBColor(79, 190, 159))
        .cornerRadius(16)
    }
  }
}

#Preview {
  PrimaryRoundedButton(text: "test", action: {})
}
