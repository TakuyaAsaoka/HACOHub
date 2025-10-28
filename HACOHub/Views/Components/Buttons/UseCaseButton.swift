//
//  UseCaseButton.swift
//  HACOHub
//
//  Created by user on 2025/10/27.
//

import SwiftUI

struct UseCaseButton: View {
	let imageName: String
	let useCaseName: String
	let description: String
	let leftColor: Color
	let rightColor: Color
	let backgroundColer: Color
	let action: () -> Void

	var body: some View {
		Button {
			action()
		} label: {
			HStack(spacing: 16) {
				Image(imageName)
					.resizable()
					.scaledToFit()
					.frame(width: 32, height: 32)
					.padding(16)
					.background(
						LinearGradient(
							gradient: Gradient(colors: [
								leftColor, rightColor
							]),
							startPoint: .leading,
							endPoint: .trailing
						)
						.cornerRadius(12)
					)
					.clipShape(RoundedRectangle(cornerRadius: 12))
				
				VStack(alignment: .leading, spacing: 4) {
					Text.sfProRegular(useCaseName, size: 18)
						.foregroundColor(.black)
					Text.sfProRegular(description, size: 14)
						.foregroundColor(getRGBColor(106, 114, 130))
						.multilineTextAlignment(.leading)
				}
				
				Spacer()
				
				Image("GrayRightArrow")
					.resizable()
					.scaledToFit()
					.frame(width: 16, height: 16)
			}
			.padding(.vertical, 20)
			.padding(.horizontal, 16)
			.background(backgroundColer)
			.cornerRadius(14)
		}
	}
}

#Preview {
	UseCaseButton(
		imageName: "AirplaneIcon",
		useCaseName: "Airport to Hotel",
		description: "Send luggage directly to\nyour hotel",
		leftColor: getRGBColor(43, 127, 255),
		rightColor: getRGBColor(0, 184, 219),
		backgroundColer: getRGBColor(245, 251, 254),
		action: {}
	)
}
