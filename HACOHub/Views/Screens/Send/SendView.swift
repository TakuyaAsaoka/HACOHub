//
//  SendView.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct SendView: View {
	@Binding var path: NavigationPath
	@State var currentStep: Int = 0

	var body: some View {
		PhaseLayoutView(
			path: $path,
			title: "Send",
			steps: sendSteps,
			currentStep: $currentStep,
      backAction: goBack,
			content: {
				SendContentView(
					currentStep: $currentStep,
				)
			},
			buttonText: "Next",
			action: goNext
		)
	}

  private func goNext() {
    if currentStep == 2 {
      path.append(Route.confirmAndPay)
    } else {
      currentStep += 1
    }
  }

  private func goBack() {
    if currentStep == 0 {
      path.removeLast()
    } else {
      currentStep -= 1
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
