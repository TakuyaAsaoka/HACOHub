//
//  RootView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct RootView: View {
  @State private var isActive = false

  var body: some View {
    ZStack {
      if isActive {
        NavigationStack {
          HomeView()
            .transition(.opacity)
        }
      } else {
        SplashView {
          isActive = true
        }
        .transition(.opacity)
      }
    }
    .animation(.easeInOut(duration: 0.5), value: isActive)
  }
}

#Preview {
  RootView()
}
