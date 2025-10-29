//
//  Layouts.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI

struct PhaseLayoutView<Content: View>: View {
	let steps: [String]
	let completeNumber: Int
	@ViewBuilder let content: () -> Content
	let buttonText: String
	let action: () -> Void
	
	var body: some View {
		VStack(spacing: 0) {
			PhaseHeaderView (
				steps: steps,
				completeNumber: completeNumber,
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

#Preview {
	PhaseLayoutView(
		steps: ["test1", "test2", "test3"],
		completeNumber: 2,
		content: {
			ZStack {
				getRGBColor(20, 30, 40, 0.2)
				Text("test")
			}
		},
		buttonText: "Next",
		action: { }
	)
}
