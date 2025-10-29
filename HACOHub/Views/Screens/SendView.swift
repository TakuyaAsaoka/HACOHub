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
	@StateObject private var addressStore = AddressStore()

	
	var body: some View {
		PhaseLayoutView(
			steps: steps,
			completeNumber: 0,
			content: { ShippingDetailView()
			.environmentObject(addressStore)
			},
			buttonText: "Next",
			action: {
				print(addressStore.address)
			}
		)
	}
}

struct ShippingDetailView: View {
	@EnvironmentObject var addressStore: AddressStore
	@State var isShowingSelectRecipientView: Bool = false
	
	var body: some View {
		ZStack {
			getRGBColor(245, 245, 247)
			
			VStack(alignment: .leading, spacing: 16) {
				Text.sfProRegular("Shipping Location", size: 16)
				MapWithPinView(address: $addressStore.address)
			}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.vertical, 20)
		.padding(.horizontal, 16)
		}
		.navigationTitle("Send")
		.navigationDestination(isPresented: $isShowingSelectRecipientView) {
			
//			SelectRecipientView()
		}
	}
}

#Preview {
	SendView()
}
