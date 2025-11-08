//
//  PhaseHeaderView.swift
//  HACOHub
//
//  Created by TakuyaAsaoka on 2025/10/28.
//

import SwiftUI

struct PhaseHeaderView<Content: View>: View {
	@Binding var path: NavigationPath
	let title: String
	let steps: [String]
	@Binding var currentStep: Int
  let backAction: () -> Void
	@ViewBuilder let content: () -> Content
	
	let backButtonWidth: CGFloat = 44
	
	var body: some View {
		VStack(spacing: 16) {
			HStack {
				Button {
          backAction()
				} label: {
					Image("BackButtonIcon")
						.resizable()
						.scaledToFit()
						.frame(width: backButtonWidth, height: backButtonWidth)
				}
				
				Spacer()
				
				Text.sfProRegular(title, size: 20)
				Spacer()
				
				Color.clear
					.frame(width: backButtonWidth, height: backButtonWidth)
		}
			
			StepperView(
				steps: steps, completeNumber: currentStep
			)
		}
		.padding(.top, 56)
		.padding(.horizontal, 20)
		.padding(.bottom, 16)
	}
}

#Preview {
	VStack(spacing: 0) {
		PhaseHeaderView(
			path: .constant(NavigationPath()),
			title: "title1",
			steps: ["test1", "test2", "test3"],
      currentStep: .constant(2),
      backAction: {},
			content: { Text("test") }
		)
		getRGBColor(29, 39, 50, 0.2)
	}
	.ignoresSafeArea()
}
