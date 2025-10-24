//
//  PopupBubbleView.swift
//  HACOHub
//
//  Created by user on 2025/10/24.
//

import SwiftUI

struct PopupBubbleView<Content: View>: View {
	let triangleWidth: CGFloat
	let triangleHeight: CGFloat
	let triangleLineWidth: CGFloat
	let offset: CGFloat
	@ViewBuilder let content: () -> Content

	var body: some View {
		ZStack {
			DownTriangle(width: triangleWidth, height: triangleHeight, lineWidth: triangleLineWidth)
				.offset(y: offset)
			
			content()
				.padding(.horizontal, 16)
				.padding(.vertical, 12)
				.background(.white)
				.cornerRadius(16)
		}
	}
}

struct DownTriangle: View {
	let width: CGFloat
	let height: CGFloat
	let lineWidth: CGFloat

		var body: some View {
				ZStack {
						Path { path in
								path.move(to: CGPoint(x: 0, y: 0))
								path.addLine(to: CGPoint(x: width, y: 0))
								path.addLine(to: CGPoint(x: width / 2, y: height))
								path.closeSubpath()
						}
						.fill(.white)
						
						Path { path in
								path.move(to: CGPoint(x: 0, y: 0))
								path.addLine(to: CGPoint(x: width, y: 0))
								path.addLine(to: CGPoint(x: width / 2, y: height))
								path.closeSubpath()
						}
						.strokedPath(StrokeStyle(lineWidth: lineWidth, lineJoin: .round))
						.foregroundColor(.white)
				}
				.frame(width: width, height: height)
		}
}

#Preview {
	ZStack {
		Color.cyan.opacity(0.5)
		PopupBubbleView(
			triangleWidth: 100,
			triangleHeight: 30,
			triangleLineWidth: 30,
			offset: 30
		) {
			Text.sfProBold("test test test test test", size: 22)
		}
	}
}
