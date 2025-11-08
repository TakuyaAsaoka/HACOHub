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
          ForEach(Friend.sampleData.prefix(2), id: \.id) { friend in
            FriendButton(friend: friend)
          }
				}
				
				Text.sfProRegular("Saved addresses", size: 14)
          .foregroundColor(getRGBColor(106, 114, 130))
          .frame(height: 20)
						
				VStack(spacing: 12) {
          ForEach(Friend.sampleData.dropFirst(2), id: \.id) { friend in
            FriendButton(friend: friend)
          }
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
