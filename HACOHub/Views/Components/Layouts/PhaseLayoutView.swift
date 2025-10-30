//
//  Layouts.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI

struct PhaseLayoutView<Content: View>: View {
	@Binding var path: NavigationPath
	let title: String
	let steps: [String]
	@Binding var currentScreen: Int
	@Binding var oldScreen: Int
	@Binding var currentFlow: Bool
	@Binding var oldFlow: Bool
	@ViewBuilder let content: () -> Content
	let buttonText: String
	let action: () -> Void
	
	var body: some View {
		VStack(spacing: 0) {
			PhaseHeaderView (
				path: $path,
				title: title,
				steps: steps,
				currentScreen: $currentScreen,
				oldScreen: $oldScreen,
				currentFlow: $currentFlow,
				oldFlow: $oldFlow,
				content: content
			)
			content()
			PrimaryRoundedButton(
				text: buttonText,
				weight: .bold,
				size: 20,
				vPadding: 20,
				radius: 16,
				action: action
			)
			.padding(.horizontal, 24)
			.padding(.top, 24)
			.padding(.bottom, 36)
			.background(.white)
		}
		.ignoresSafeArea()
	}
}

//#Preview {
//	PhaseLayoutView(
//		path: .constant(NavigationPath()),
//		title: "title1",
//		steps: ["test1", "test2", "test3"],
//		currentScreen: 2,
//		content: {
//			ZStack {
//				getRGBColor(20, 30, 40, 0.2)
//				Text("test")
//			}
//		},
//		buttonText: "Next",
//		action: { }
//	)
//}
