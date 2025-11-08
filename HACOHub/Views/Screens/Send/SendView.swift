//
//  SendView.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct SendView: View {
	@Binding var path: NavigationPath
	@State var currentPhase: Int = 0

	var body: some View {
		PhaseLayoutView(
			path: $path,
			title: "Send",
			steps: sendSteps,
			currentPhase: $currentPhase,
      backAction: goBack,
			content: {
				SendContentView(
					currentStep: $currentPhase,
				)
			},
			buttonText: "Next",
			action: goNext
		)
	}

  private func goNext() {
    if currentPhase == 2 {
      path.append(Route.confirmAndPay)
    } else {
      currentPhase += 1
    }
  }

  private func goBack() {
    if currentPhase == 0 {
      path.removeLast()
    } else {
      currentPhase -= 1
    }
  }
}

struct SendContentView: View {
	@Binding var currentStep: Int

	var body: some View {
    TabView(selection: $currentStep) {
      ShippingDetailContentView().tag(0)
      DeliveryDetailContentView().tag(1)
      SelectHacoHubContentView().tag(2)
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
		.animation(.easeInOut, value: currentStep)
	}
}

#Preview {
	SendView(path: .constant(NavigationPath()))
    .environmentObject(SendStore())
}
