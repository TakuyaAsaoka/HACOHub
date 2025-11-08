//
//  InputBoxView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct InputBoxView: View {
	let imageName: String
	@Binding var text: String?
  let placeholder: String

  @FocusState private var isFocused: Bool

	var body: some View {
		HStack(spacing: 12) {
			Image(imageName)
			
      TextField(placeholder, text: Binding(
        get: { text ?? "" },
        set: { newValue in text = newValue.isEmpty ? nil : newValue }
      ))
      .padding(.vertical, 14)
      .focused($isFocused)
		}
		.padding(.horizontal, 12)
		.background(.white)
		.cornerRadius(8)
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(isFocused ? getRGBColor(110, 119, 129) : Color.clear, lineWidth: 1)
    )
	}
}

#Preview {
	ZStack {
		getRGBColor(240, 240, 240)
		InputBoxView(
      imageName: "GreenLocationIcon",
      text: .constant(""),
      placeholder: "Enter location"
    )
	}
}
