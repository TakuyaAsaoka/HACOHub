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
	let completeNumber: Int
	@ViewBuilder let content: () -> Content
	
	let backButtonWidth: CGFloat = 36
	
	var body: some View {
		VStack(spacing: 28) {
			HStack {
				Button {
					if !path.isEmpty { path.removeLast() }
				} label: {
					Image("GreenPinIcon")
						.resizable()
						.scaledToFit()
						.frame(width: backButtonWidth, height: backButtonWidth)
				}
				
				Spacer()
				
				Text.sfProBold(title, size: 16)
				Spacer()
				
				Color.clear
					.frame(width: backButtonWidth, height: backButtonWidth)
		}
			
			StepperView(
				steps: steps, completeNumber: completeNumber
			)
		}
		.padding(.top, 60)
		.padding(.horizontal, 20)
		.padding(.bottom, 12)
	}
}

#Preview {
	VStack(spacing: 0) {
		PhaseHeaderView(
			path: .constant(NavigationPath()),
			title: "title1",
			steps: ["test1", "test2", "test3"],
			completeNumber: 2,
			content: { Text("test") }
		)
		getRGBColor(29, 39, 50, 0.2)
	}
	.ignoresSafeArea()
}
