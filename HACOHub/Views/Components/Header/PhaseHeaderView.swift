//
//  PhaseHeaderView.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI

struct PhaseHeaderView<Content: View>: View {
	@Binding var path: NavigationPath
	let title: String
	let steps: [String]
	@Binding var currentScreen: Int
	@Binding var oldScreen: Int
	@Binding var currentFlow: Bool
	@Binding var oldFlow: Bool
	@ViewBuilder let content: () -> Content
	
	let backButtonWidth: CGFloat = 44
	
	var body: some View {
		VStack(spacing: 16) {
			HStack {
				Button {
					oldFlow = currentFlow
					currentFlow = false
					oldScreen = currentScreen
					if currentScreen == 0 {
						if !path.isEmpty { path.removeLast() }
					} else if currentScreen > 0 {
						currentScreen -= 1
					}
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
				steps: steps, completeNumber: currentScreen
			)
		}
		.padding(.top, 56)
		.padding(.horizontal, 20)
		.padding(.bottom, 16)
	}
}

//#Preview {
//	VStack(spacing: 0) {
//		PhaseHeaderView(
//			path: .constant(NavigationPath()),
//			title: "title1",
//			steps: ["test1", "test2", "test3"],
//			currentScreen: 2,
//			content: { Text("test") }
//		)
//		getRGBColor(29, 39, 50, 0.2)
//	}
//	.ignoresSafeArea()
//}
