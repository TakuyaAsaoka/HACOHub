//
//  DeliveryDetailView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

//struct DeliveryDetailView: View {
//	@Binding var path: NavigationPath
//
//	var body: some View {
//		PhaseLayoutView(
//			path: $path,
//			title: "Send",
//			steps: sendSteps,
//			completeNumber: 1,
//			content: {
//				DeliveryDetailContentView()
//			},
//			buttonText: "Next",
//			action: {
//				path.append(Route.selectHacoHub)
//			}
//		)
//	}
//}

struct DeliveryDetailContentView: View {
	@State var selectedFriend: String? = "Luka Moretti"
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 8) {
				Text.sfProRegular("Select recipient", size: 16,)
						.foregroundColor(getRGBColor(54, 54, 83))
				Text.sfProRegular("Recent recipients", size: 14)
						.foregroundColor(getRGBColor(106, 114, 130))

				VStack(spacing: 12) {
						FriendButton(
							friendImage: Image("LukaMoretti"),
							name: "Luka Moretti",
							address: "Atlanta, GA",
							phone: "",
							selectedFriend: $selectedFriend
						)
						FriendButton(
								friendImage: Image("AishaKhan"),
								name: "Aisha Khan",
								address: "Dallas, TX",
								phone: "",
								selectedFriend: $selectedFriend
						)
				}
				
				Text.sfProRegular("Saved addresses", size: 14)
						.foregroundColor(getRGBColor(106, 114, 130))
						.frame(height: 20)
						
				VStack(spacing: 12) {
					FriendButton(
							friendImage: Image("ElenaRojas"),
							name: "Elena Rojas",
							address: "Los Angeles, CA",
							phone: "",
							selectedFriend: $selectedFriend
					)
					FriendButton(
							friendImage: Image("OmarAISayed"),
							name: "Omar AI-Sayed",
							address: "Seattle, WA",
							phone: "",
							selectedFriend: $selectedFriend
					)
					FriendButton(
							friendImage: Image("SofiaPetrova"),
							name: "Sofia Petrova",
							address: "Forest, MS",
							phone: "",
							selectedFriend: $selectedFriend
					)
					FriendButton(
							friendImage: Image("MiaKhan"),
							name: "Mia Khan",
							address: "Dallas, TX",
							phone: "",
							selectedFriend: $selectedFriend
					)
				}
				Spacer()
			}
		}
		.padding(.top, 20)
		.padding(.horizontal, 20)
		.background(getRGBColor(240, 242, 245))
	}
}


#Preview {
//	DeliveryDetailView(path: .constant(NavigationPath()))
}
