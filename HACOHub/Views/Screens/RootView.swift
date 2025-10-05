//
//  RootView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct RootView: View {
  @AppStorage("hasLaunchedBefore") var hasLaunchedBefore: Bool = false
  @State private var isActive = false

  var body: some View {
    ZStack {
      if !isActive {
        SplashView {
          isActive = true
        }
        .transition(.opacity)
      } else {
        if hasLaunchedBefore {
          NavigationStack {
            HacoHubTabView()
              .transition(.opacity)
            }
        } else {
          OnboardingView()
            .transition(.opacity)
        }
      }
    }
    .animation(.easeInOut(duration: 0.5), value: isActive)
  }
}

#Preview {
  RootView()
}
