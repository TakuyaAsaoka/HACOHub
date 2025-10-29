//
//  InputBoxView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct InputBoxView: View {
	let imageName: String
	@Binding var text: String

	var body: some View {
		HStack(spacing: 12) {
			Image(imageName)
			
			TextField("Enter location", text: $text)
			.padding(.vertical, 8)
		}
		.padding(.horizontal, 12)
		.background(.white)
		.cornerRadius(8)
	}
}

#Preview {
	ZStack {
		getRGBColor(240, 240, 240)
		InputBoxView(imageName: "GreenLocationIcon", text: .constant(""))
	}
}
