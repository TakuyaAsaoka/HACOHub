//
//  ActionButton.swift
//  HACOHub
//
//  Created by user on 2025/10/27.
//

import SwiftUI

struct ActionButton: View {
	let action: Action
	let description: String
	let imageName: String
	let imageWidth: CGFloat
	let imageHeight: CGFloat
	let offsetX: CGFloat
	let offsetY: CGFloat
	
	var body: some View {
		Button {
			
		} label: {
			ZStack {
				VStack(alignment: .leading, spacing: 4) {
					Text.sfProBold(action.rawValue, size: 20)
						.foregroundColor(getRGBColor(36, 41, 47))
					Text.sfProRegular(description, size: 20)
						.foregroundColor(getRGBColor(106, 114, 130))
						.multilineTextAlignment(.leading)
					Spacer()
				}
				
				Image(imageName)
					.resizable()
					.frame(width: imageWidth, height: imageHeight)
					.offset(x: offsetX, y: offsetY)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.frame(height: 176)
			.padding(.leading, 24)
			.padding(.top, 20)
			.background(
				RoundedRectangle(cornerRadius: 16)
					.fill(.white)
					.stroke(getRGBColor(208, 215, 222), lineWidth: 1)
					.shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
					.shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
			)
		}
	}
}

#Preview {
	ActionButton(
		action: .send,
		description: "Ship item to\nanyone",
		imageName: "SendIcon",
		imageWidth: 79,
		imageHeight: 69,
		offsetX: 18,
		offsetY: 24
	)
}
