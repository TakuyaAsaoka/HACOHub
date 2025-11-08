//
//  ReceiveConfirmAndPay.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct ReceiveConfirmAndPayView: View {
	@Binding var path: NavigationPath
	@EnvironmentObject var receiveStore: ReceiveStore
	
	var body: some View {
		VStack(spacing: 0) {
			NormalHeader(path: $path, title: "Receive Confirmation")
			
			ZStack {
				getRGBColor(245, 247, 247)
				
				VStack(alignment: .leading, spacing: 16) {
					HStack(spacing: 12) {
						Image("GreenPinIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 20, height: 20)
						
						VStack(alignment: .leading) {
							Text.sfProRegular("Location", size: 12)
								.foregroundColor(getRGBColor(106, 114, 130))
							Text.sfProMedium(receiveStore.location, size: 16)
						}
					}
					
					HStack(spacing: 12) {
						Image("GreenUserIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 20, height: 20)
						
						VStack(alignment: .leading) {
							Text.sfProRegular("HACOHub Vehicle", size: 12)
								.foregroundColor(getRGBColor(106, 114, 130))
							Text.sfProMedium("Stark", size: 16)
						}
					}
					
					HStack(spacing: 12) {
						Image("GreenLugageIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 20, height: 20)
						
						VStack(alignment: .leading) {
							Text.sfProRegular("Locker Size", size: 12)
								.foregroundColor(getRGBColor(106, 114, 130))
							Text.sfProMedium("Small", size: 16)
						}
					}
				}
				.padding(24)
				.frame(maxWidth: .infinity)
				.background(.white)
				.cornerRadius(14)
				.shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
				.shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)
			}
			
			Image("ReceiveConfirmationCard")
				.resizable()
				.scaledToFit()
			
			Spacer()
		}
	}
}

#Preview {
	ReceiveConfirmAndPayView(path: .constant(NavigationPath()))
			.environmentObject(ReceiveStore())
}
