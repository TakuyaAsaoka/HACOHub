//
//  PhaseHeaderView.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI

struct PhaseHeaderView<Content: View>: View {
	let steps: [String]
	let completeNumber: Int
	@ViewBuilder let content: () -> Content
	
	var body: some View {
		VStack(spacing: 28) {
			StepperView(
				steps: steps, completeNumber: completeNumber
			)
		}
		.padding(.horizontal, 20)
		.padding(.bottom, 12)
	}
}

#Preview {
	VStack(spacing: 0) {
		PhaseHeaderView(
			steps: ["test1", "test2", "test3"],
			completeNumber: 2,
			content: { Text("test") }
		)
		getRGBColor(29, 39, 50, 0.2)
	}
	.ignoresSafeArea()
}
