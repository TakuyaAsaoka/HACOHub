//
//  NormalHeader.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct NormalHeader: View {
	@Binding var path: NavigationPath
	let title: String

	let backButtonWidth: CGFloat = 44

	var body: some View {
		HStack {
			Button {
				if !path.isEmpty { path.removeLast() }
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
		.padding(.top, 56)
		.padding(.horizontal, 24)
		.padding(.bottom, 16)
		.background(.white)
	}
}

#Preview {
	VStack(spacing: 0) {
		NormalHeader(
			path: .constant(NavigationPath()),
			title: "test"
		)

		getRGBColor(29, 39, 50, 0.2)
	}
	.ignoresSafeArea()
}
