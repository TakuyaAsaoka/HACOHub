//
//  CommingSoonView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct ComingSoonView: View {
	var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
		
			VStack(spacing: 25) {
			Image("CommingSoonIcon")
				.resizable()
				.scaledToFit()
				.frame(width: 380, height: 234)
				Text.sfProMedium("Coming\nSoon!!", size: 64)
					.foregroundColor(getRGBColor(79, 190, 159))
					.multilineTextAlignment(.center)
			}
		}
		.ignoresSafeArea()
	}
}

#Preview {
    ComingSoonView()
}
