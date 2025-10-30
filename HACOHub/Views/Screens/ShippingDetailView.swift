//
//  SendView.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI

//struct ShippingDetailView: View {
//	@StateObject private var sendStore = SendStore()
//	@State var isShowingSelectRecipientView: Bool = false
//	@Binding var path: NavigationPath
//
//	var body: some View {
//		PhaseLayoutView(
//			path: $path,
//			title: "Send",
//			steps: sendSteps,
//			completeNumber: 0,
//			content: {
//				ShippingDetailContentView()
//				.environmentObject(sendStore)
//			},
//			buttonText: "Next",
//			action: {
//				path.append(Route.deliveryDetail)
//				print("path: \(path)")
//				print(sendStore.address)
//			}
//		)
//	}
//}

struct ShippingDetailContentView: View {
	@EnvironmentObject var sendStore: SendStore
	
	var body: some View {
		ZStack {
			getRGBColor(245, 245, 247)
			
			VStack(alignment: .leading, spacing: 16) {
				Text.sfProRegular("Shipping Location", size: 16)
				MapWithPinView(location: $sendStore.location)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.vertical, 20)
			.padding(.horizontal, 16)
		}
	}
}

#Preview {
//	ShippingDetailView(path: .constant(NavigationPath()))
}
