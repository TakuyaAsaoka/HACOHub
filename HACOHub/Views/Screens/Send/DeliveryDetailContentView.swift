//
//  DeliveryDetailView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct DeliveryDetailContentView: View {
	@EnvironmentObject var sendStore: SendStore
	
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
							friend: Friend.lucaMoretti.friend,
							storeFriend: $sendStore.friend
						)
						FriendButton(
								friendImage: Image("AishaKhan"),
								friend: Friend.aishaKhan.friend,
								storeFriend: $sendStore.friend
						)
				}
				
				Text.sfProRegular("Saved addresses", size: 14)
						.foregroundColor(getRGBColor(106, 114, 130))
						.frame(height: 20)
						
				VStack(spacing: 12) {
					FriendButton(
							friendImage: Image("ElenaRojas"),
							friend: Friend.elenaRojas.friend,
							storeFriend: $sendStore.friend
					)
					FriendButton(
							friendImage: Image("OmarAISayed"),
							friend: Friend.omarAlSayed.friend,
							storeFriend: $sendStore.friend
					)
					FriendButton(
							friendImage: Image("SofiaPetrova"),
							friend: Friend.sofiaPetrova.friend,
							storeFriend: $sendStore.friend
					)
					FriendButton(
							friendImage: Image("MiaKhan"),
							friend: Friend.miaKhan.friend,
							storeFriend: $sendStore.friend
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
	DeliveryDetailContentView()
    .environmentObject(SendStore())
}
