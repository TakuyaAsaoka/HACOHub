//
//  SendView.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI

struct SendView: View {
	let steps: [String] = [
		"Shipping\ndetail",
		"Delivery\ndetail",
		"Select\na HACOHub",
	]
	@State var address: String = ""
	
	var body: some View {
		PhaseLayoutView(
			steps: steps,
			completeNumber: 1,
			content: { ShippingDetailView(
				address: $address
			) },
			buttonText: "Next",
			action: {
				
			}
		)
	}
}

struct ShippingDetailView: View {
	@Binding var address: String
	
	var body: some View {
		VStack(spacing: 16) {
			Text.sfProRegular("Shipping Location", size: 16)
			MapWithPinView(mapHeight: 354)
			Spacer()
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.top, 20)
		.padding(.horizontal, 16)
	}
}

#Preview {
	SendView()
}
