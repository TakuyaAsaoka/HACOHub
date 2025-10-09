//
//  PrimarySpinner.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/10.
//

import SwiftUI

struct PrimarySpinner: View {
  @State private var isAnimating = false

  var body: some View {
    ZStack {
      Circle()
        .stroke(
          getRGBColor(208, 215, 222),
          lineWidth: 12
        )

      Circle()
        .trim(from: 0, to: 0.75)
        .stroke(
          getRGBColor(79, 190, 159),
          style: StrokeStyle(
            lineWidth: 12,
            lineCap: .round
          )
        )
        .rotationEffect(.degrees(isAnimating ? 360 : 0))
        .animation(
          Animation.linear(duration: 1)
            .repeatForever(autoreverses: false),
          value: isAnimating
        )
    }
    .frame(width: 100, height: 100)
    .onAppear {
      isAnimating = true
    }
  }
}

#Preview {
    PrimarySpinner()
}
