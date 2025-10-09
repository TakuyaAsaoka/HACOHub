//
//  DimmedOverlayModalView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/09.
//

import SwiftUI

struct DimmedOverlayModalView<Content: View>: View {
  let vPadding: CGFloat
  @ViewBuilder let content: () -> Content

  var body: some View {
    ZStack {
      DimmedView()
      OverlayView(vPadding: vPadding) {
        content()
      }
      .padding(.horizontal, 24)
    }
  }
}

struct DimmedView: View {
  var body: some View {
    getRGBColor(107, 107, 107, 0.8)
      .ignoresSafeArea()
  }
}

struct OverlayView<Content: View>: View {
  let vPadding: CGFloat
  let content : () -> Content

  var body: some View {
    content()
      .frame(maxWidth: .infinity)
      .padding(.vertical, vPadding)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.white)
          .shadow(color: Color.black.opacity(0.2), radius: 32, x: 0, y: 0)
      )
  }
}

#Preview {
  DimmedOverlayModalView(vPadding: 20) {
    Text("test")
  }
}
