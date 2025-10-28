//
//  NearbyHacoHubLocationButton.swift
//  HACOHub
//
//  Created by user on 2025/10/27.
//

import SwiftUI

struct NearbyHacoHubLocationButton: View {
	let location: String
	let distance: String
	let availableNumber: Int
	
	var body: some View {
		Button {
			
		} label: {
			HStack(spacing: 12) {
				Image("GreenPinIcon")
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
					.padding(10)
					.background(
						 Circle()
							.fill(getRGBColor(79, 190, 159, 0.1))
					 )
				
				VStack(alignment: .leading) {
					Text.sfProRegular(location, size: 16)
						.foregroundColor(.black)
					Text.sfProRegular("\(distance) mi away", size: 16)
						.foregroundColor(getRGBColor(106, 114, 130))
				}
			
				Spacer()
			
				Text.sfProMedium("\(availableNumber) available", size: 12)
					.foregroundColor(getRGBColor(79, 190, 159))
					.padding(.vertical, 3)
					.padding(.horizontal, 8)
					.overlay(
						RoundedRectangle(cornerRadius: 8)
							.stroke(getRGBColor(79, 190, 159), lineWidth: 1)
					)
			}
			.padding(.horizontal, 24)
			.padding(.vertical, 8)
			.background(
				RoundedRectangle(cornerRadius: 14)
					.fill(.white)
			)
			.shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
			.shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
		}
	}
}

#Preview {
	NearbyHacoHubLocationButton(
		location: "Shibuya Station",
		distance: "0.3",
		availableNumber: 12
	)
}
