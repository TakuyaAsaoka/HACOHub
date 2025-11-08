//
//  DeliveryDetailsWhiteCard.swift
//  HACOHub
//
//  Created by RIKI on 2025/10/30.
//
import SwiftUI

struct DeliveryDetailsWhiteCard: View {
	@EnvironmentObject var sendStore: SendStore
	
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			HStack(alignment: .top, spacing: 12) {
				Image("GreenMapIcon")
					.resizable()
					.scaledToFit()
					.frame(width: 20, height: 20)
					.padding(.top, 10)
				
				VStack(alignment: .leading, spacing: 4) {
					Text.sfProRegular("Shipping Location", size: 12)
						.foregroundColor(getRGBColor(106, 114, 130, 1))
					
          Text.sfProRegular(
            sendStore.location ?? "Not available",
            size: 16
          )
          .foregroundColor(
            sendStore.location == nil
            ? Color.gray.opacity(0.5)
            : getRGBColor(36, 41, 47)
          )
				}
			}
			
			HStack(alignment: .top, spacing: 12) {
				Image("GreenHouseIcon")
					.resizable()
					.frame(width: 20, height: 20)
					.padding(.top, 5)
				
				VStack(alignment: .leading, spacing: 5) {
					Text.sfProRegular("Recipient Information", size: 12)
						.foregroundColor(getRGBColor(106, 114, 130, 1))
					
          VStack(alignment: .leading, spacing: 9) {
						Text.sfProMedium(sendStore.friend.name, size: 16)
							.foregroundColor(getRGBColor(36, 41, 47, 1))
							.padding(.top, 9)
						
						VStack(alignment: .leading, spacing: 0) {
							Text.sfProRegular("Address", size: 14)
								.foregroundColor(getRGBColor(106, 114, 130, 1))
							
							Text.sfProRegular(sendStore.friend.address, size: 14)
								.foregroundColor(getRGBColor(36, 41, 47, 1))
						}

						VStack(alignment: .leading, spacing: 0) {
							Text.sfProRegular("Phone Number", size: 14)
								.foregroundColor(getRGBColor(106, 114, 130, 1))
							
							Text.sfProRegular(sendStore.friend.phoneNumber, size: 14)
								.foregroundColor(getRGBColor(36, 41, 47, 1))
						}
					}
          .frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal, 18)
					.padding(.top, 8)
					.padding(.bottom, 16)
					.overlay(
							RoundedRectangle(cornerRadius: 14)
								.stroke(getRGBColor(208, 215, 222), lineWidth: 2)
					)
					.cornerRadius(14)
				}
			}
		}
		.padding(24)
		.background(.white)
		.cornerRadius(12)
		.shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
		.shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
	}
}

#Preview {
	DeliveryDetailsWhiteCard()
		.environmentObject(SendStore())
}
