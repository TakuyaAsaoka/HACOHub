//
//  ChangePickUpLocation.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct ChangePickUpLocationView: View {
	@Binding var path: NavigationPath
	@EnvironmentObject var receiveStore: ReceiveStore
	
	var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
			
			VStack(alignment: .leading, spacing: 0) {
				NormalHeader(path: $path, title: "Receive")
				
				VStack(alignment: .leading, spacing: 8) {
					VStack(alignment: .leading, spacing: 16) {
						HStack {
							Text.sfProRegular("Your item", size: 16)
								.foregroundColor(getRGBColor(54, 65, 83))
							Spacer()
						}
						
						YourItemCard()
						
						HStack {
							Text.sfProRegular("Select pickup location", size: 16)
								.foregroundColor(getRGBColor(54, 65, 83))
							Spacer()
						}
						
						HStack {
							Text.sfProRegular("Search or enter location", size: 14)
								.foregroundColor(getRGBColor(66, 74, 83))
							Spacer()
						}
						
						MapWithPinView(latitude: 33.778219, longitude: -84.380027, location: $receiveStore.location)
							.frame(maxWidth: .infinity, alignment: .leading)
						
//						HStack {
//							Text.sfProRegular("Select pickup time", size: 16)
//								.foregroundColor(getRGBColor(66, 74, 83))
//							Spacer()
//						}
					}
					.padding(.horizontal, 20)
					.padding(.top, 20)
					.padding(.bottom, 8)
					
					PrimaryRoundedButton(
						text: "Confirm",
						weight: .bold,
						size: 20,
						vPadding: 20,
						radius: 16,
						action: {
							path.append(Route.receiveConfirmAndPay)
						}
					)
					.padding(.top, 24)
					.padding(.bottom, 36)
					.padding(.horizontal, 24)
					.background(.white)
				}
			}
		}
		.ignoresSafeArea()
	}
}

#Preview {
	ChangePickUpLocationView(path: .constant(NavigationPath()))
		.environmentObject(ReceiveStore())
}
