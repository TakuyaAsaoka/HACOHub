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
	@StateObject private var sendStore = SendStore()
	@StateObject private var receiveStore = ReceiveStore()

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
										.environmentObject(sendStore)
										.navigationBarBackButtonHidden(true)
										.toolbarBackground(.hidden, for: .navigationBar)
								case .confirmAndPay:
									ConfirmAndPayView(path: $path, selectedTab: $selectedTab)
										.environmentObject(sendStore)
										.navigationBarBackButtonHidden(true)
										.toolbarBackground(.hidden, for: .navigationBar)
								case .receive:
									ReceiveView(path: $path)
										.environmentObject(sendStore)
										.navigationBarBackButtonHidden(true)
										.toolbarBackground(.hidden, for: .navigationBar)
								case .changePickUpLocation:
									ChangePickUpLocationView(path: $path)
										.environmentObject(receiveStore)
										.navigationBarBackButtonHidden(true)
										.toolbarBackground(.hidden, for: .navigationBar)
								case .receiveConfirmAndPay:
									ReceiveConfirmAndPayView(path: $path)
										.environmentObject(receiveStore)
										.navigationBarBackButtonHidden(true)
										.toolbarBackground(.hidden, for: .navigationBar)
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
