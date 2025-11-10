//
//  UpcomingCard.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct ReceiveCard: View {
	@Binding var path: NavigationPath
	@Binding var isShowingQR: Bool
  @EnvironmentObject var receiveStore: ReceiveStore

	var body: some View {
		Button {
			path.append(Route.changePickUpLocation)
		} label: {
			VStack(alignment: .leading, spacing: 16) {
        ZStack(alignment: .topLeading) {
          HStack(alignment: .top, spacing: 12) {
            Image("iPhone")
              .resizable()
              .scaledToFit()
              .frame(width: 48, height: 48)

            VStack(alignment: .leading, spacing: 10) {
              Text.sfProRegular("From Amazon", size: 12)
                .foregroundColor(getRGBColor(106, 114, 130))

              Text.sfProRegular("iPhone 20", size: 14)
                .foregroundColor(getRGBColor(30, 41, 57))

              HStack(spacing: 4) {
                Image("GreenLugageIcon")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 14, height: 14)
                Text.sfProRegular(receiveStore.size, size: 12)
                  .foregroundColor(getRGBColor(74, 85, 101))
              }

              HStack(spacing: 4) {
                Image("GreenTrackIcon")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 14, height: 14)
                Text.sfProRegular(receiveStore.location ?? "Unregisterd", size: 12)
                  .foregroundColor(getRGBColor(74, 85, 101))
              }

              Divider()
                .background(getRGBColor(243, 244, 246))

              Text.sfProRegular("Shipping No: EC119214", size: 12)
                .foregroundColor(getRGBColor(106, 114, 130))
            }
            .padding(.top, 4)
          }

          HStack(alignment: .top, spacing: 0) {
            Spacer()
            Text.sfProMedium("Receive", size: 14)
              .foregroundColor(getRGBColor(230, 20, 146))
              .padding(.vertical, 4)
              .padding(.horizontal, 17)
              .background(getRGBColor(254, 219, 233))
              .overlay(
                RoundedRectangle(cornerRadius: 12)
                  .stroke(getRGBColor(255, 190, 215), lineWidth: 1)
              )
              .cornerRadius(12)
          }
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
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)

				WhiteRoundedButton(
					text: "Change pickup location",
					textColor: getRGBColor(36, 41, 47),
					weight: .regular,
					size: 16,
					vPadding: 10,
					radius: 11,
					action: {
						path.append(Route.changePickUpLocation)
					}
				)
				.shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 2)
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
	ReceiveCard(path: .constant(NavigationPath()), isShowingQR: .constant(false))
    .environmentObject(ReceiveStore())
}
