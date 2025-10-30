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
	@State private var path = NavigationPath()
	@State private var selectedTab = 0

  var body: some View {
    ZStack {
      if !isActive {
        SplashView {
          isActive = true
        }
        .transition(.opacity)
      } else {
        if hasLaunchedBefore {
					NavigationStack(path: $path) {
						HacoHubTabView(selectedTab: $selectedTab, path: $path)
              .transition(.opacity)
							.navigationDestination(for: Route.self) { route in
								switch route {
								case .send:
									SendView(path: $path)
										.navigationBarBackButtonHidden(true)
										.toolbarBackground(.hidden, for: .navigationBar)
								case .confirmAndPay:
									ConfirmAndPayView(path: $path, selectedTab: $selectedTab)
										.navigationBarBackButtonHidden(true)
										.toolbarBackground(.hidden, for: .navigationBar)
								case .receive:
									ComingSoonView()
								}
							}
					}
        } else {
					OnboardingView(path: $path)
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
