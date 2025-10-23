//
//  HACOHubHeaderLayout.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/24.
//

import SwiftUI

struct HACOHubHeaderLayout<Content: View>: View {
  @ViewBuilder let content: () -> Content

  var body: some View {
    VStack(spacing: 0) {
      HomeHeaderView()
      content()
    }
  }
}

#Preview {
  HACOHubHeaderLayout {
    ZStack {
      getRGBColor(33, 44, 66)
      Text.sfProBold("test", size: 36)
        .foregroundColor(Color.white)
    }
  }
  .ignoresSafeArea()
}
