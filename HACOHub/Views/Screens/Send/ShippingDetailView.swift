//
//  SendView.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI
import MapKit

struct ShippingDetailContentView: View {
	@EnvironmentObject var sendStore: SendStore
	
	var body: some View {
		ZStack {
			getRGBColor(245, 245, 247)

			VStack(alignment: .leading, spacing: 16) {
				Text.sfProRegular("Shipping Location", size: 16)

        InputBoxView(
          imageName: "GreenLocationIcon",
          text: $sendStore.location,
          placeholder: "Enter location"
        )

				MapPickerView(
          latitude: $sendStore.latitude,
          longitude: $sendStore.longitude,
          location: $sendStore.location
        )
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.vertical, 20)
			.padding(.horizontal, 16)
		}
	}
}

#Preview {
	ShippingDetailContentView()
    .environmentObject(SendStore())
}
