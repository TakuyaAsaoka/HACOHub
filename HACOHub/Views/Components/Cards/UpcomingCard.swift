//
//  UpcomingCard.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct UpcomingCard: View {
		@Binding var isShowingQR: Bool
		@State var isShowingDetails: Bool = false

		var body: some View {
			Button {
				withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
					isShowingDetails.toggle()
				}
			} label: {
				VStack(alignment: .leading, spacing: 8) {
					HStack {
						Spacer()
						Text.sfProMedium("Send", size: 14)
							.foregroundColor(getRGBColor(20, 71, 230))
							.padding(.vertical, 4)       // 上下の余白
							.padding(.horizontal, 17)    // 左右の余白
							.background(getRGBColor(219, 234, 254))
							.overlay(
									RoundedRectangle(cornerRadius: 12)
											.stroke(getRGBColor(190, 219, 255), lineWidth: 1) // 水色の枠線
							)
							.cornerRadius(12)
					}

					Image("UpcomingMap")
						.resizable()
						.scaledToFit()
						.frame(maxWidth: .infinity)
					
					VStack(alignment: .leading, spacing: 0) {
						Text.sfProMedium("101 Piedmont Ave SE, Atlanta, GA", size: 16)
							.foregroundColor(getRGBColor(36, 41, 47))
						Text.sfProRegular("Today, PM5:00", size: 14)
							.foregroundColor(getRGBColor(110, 119, 129))
					}
					
					PrimaryRoundedButton(
						text: "Scan a QR code",
						weight: .bold,
						size: 16,
						vPadding: 10,
						radius: 11,
						action: {
							isShowingQR = true
						}
					)
					
					WhiteRoundedButton(
						text: isShowingDetails ? "Hide detail" :"View detail",
						textColor: getRGBColor(36, 41, 47),
						weight: .regular,
						size: 16,
						vPadding: 10,
						radius: 11,
						action: {
							isShowingDetails.toggle()
						}
					)
					.shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
					
					if isShowingDetails {
						Text.sfProMedium("Delivery Details", size: 16)
						Image("ActivityGreenCard")
							.resizable()
							.scaledToFit()
						Image("ActivityWhiteCard")
							.resizable()
							.scaledToFit()
					}
				}
				.padding(.top, 17)
				.padding(.bottom, 19)
				.padding(.horizontal, 20)
				.background(.white)
				.overlay(
					RoundedRectangle(cornerRadius: 16)
						.stroke(
							getRGBColor(208, 215, 222),
							lineWidth: 1
						)
				)
				.cornerRadius(14)
			}
			.buttonStyle(.plain)
		}
}

#Preview {
	UpcomingCard(isShowingQR: .constant(false))
}
