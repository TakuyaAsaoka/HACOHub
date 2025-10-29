//
//  DeliveryDetailView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct DeliveryDetailView: View {
	let steps: [String] = [
		"Shipping\ndetail",
		"Delivery\ndetail",
		"Select\na HACOHub",
	]
	@State var isShowingSelectHacoHub: Bool = false

	var body: some View {
		PhaseLayoutView(
			steps: steps,
			completeNumber: 1,
			content: {
				SelectRecipientView()
			},
			buttonText: "Next",
			action: {
				isShowingSelectHacoHub = true
			}
		)
		.navigationTitle("Send")
		.navigationDestination(isPresented: $isShowingSelectHacoHub) {
			LayoutSelectHacoHubView()
		}
	}
}

#Preview {
	DeliveryDetailView()
}
