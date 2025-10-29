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
	@StateObject private var addressStore = SendStore()
	@State var isShowingSelectRecipientView: Bool = false

	var body: some View {
		PhaseLayoutView(
			steps: steps,
			completeNumber: 0,
			content: { ShippingDetailView(isShowingSelectRecipientView: $isShowingSelectRecipientView)
			.environmentObject(addressStore)
			},
			buttonText: "Next",
			action: {
				isShowingSelectRecipientView = true
				print(addressStore.address)
			}
		)
	}
}

struct ShippingDetailView: View {
	@EnvironmentObject var sendStore: SendStore
	@Binding var isShowingSelectRecipientView: Bool
	
	var body: some View {
		ZStack {
			getRGBColor(245, 245, 247)
			
			VStack(alignment: .leading, spacing: 16) {
				Text.sfProRegular("Shipping Location", size: 16)
				MapWithPinView(address: $sendStore.address)
			}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.vertical, 20)
		.padding(.horizontal, 16)
		}
		.navigationTitle("Send")
		.navigationDestination(isPresented: $isShowingSelectRecipientView) {
			DeliveryDetailView()
		}
	}
}

#Preview {
	SendView()
}
