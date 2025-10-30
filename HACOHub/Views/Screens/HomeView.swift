//
//  HomeView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct HomeView: View {
  @State var action: Action? = nil
	@Binding var path: NavigationPath

  struct UseCases: Identifiable {
		let id = UUID()
		let imageName: String
		let useCaseName: String
		let description: String
		let leftColor: Color
		let rightColor: Color
		let backgroundColer: Color
  }

	let UseCaseButtons: [UseCases] = [
		 UseCases(
			imageName: "AirplaneIcon",
			useCaseName: "AirPort to Hotel",
			description: "Send luggage directly\nto your hotel",
			leftColor: getRGBColor(43, 127, 255),
			rightColor: getRGBColor(0, 184, 219),
			backgroundColer: getRGBColor(245, 251, 254),
		),
		 UseCases(
			imageName: "EventIcon",
			useCaseName: "Event Locker",
			description: "Store items during events",
			leftColor: getRGBColor(173, 70, 255),
			rightColor: getRGBColor(246, 51, 154),
			backgroundColer: getRGBColor(252, 245, 251),
		),
		 UseCases(
			imageName: "PeopleIcon",
			useCaseName: "Send to Friend",
			description: "Share items via secure locker",
			leftColor: getRGBColor(0, 188, 125),
			rightColor: getRGBColor(0, 187, 167),
			backgroundColer: getRGBColor(245, 252, 250),
		)
	]
    
	struct NearbyHacohubLocation: Identifiable {
		let id = UUID()
		let location: String
		let distance: String
		let availableNumber: Int
	}

	let NearbyHacohubLocations: [NearbyHacohubLocation] = [
		NearbyHacohubLocation(
			location: "Shibuya Station",
			distance: "0.3",
			availableNumber: 5
		),
		NearbyHacohubLocation(
			location: "Omotesando Hills",
			distance: "0.8",
			availableNumber: 5
		),
		NearbyHacohubLocation(
			location: "Harajuku Center",
			distance: "1.2",
			availableNumber: 5
		),
	]
    
  var body: some View {
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading, spacing: 16) {
					Text.sfProRegular("What would you like to do?", size: 16)
						.foregroundColor(getRGBColor(54, 65, 83))
					
					VStack(spacing: 12) {
						HStack(spacing: 21) {
							ActionButton(
								actionName: .send,
								description: "Ship item to\nanyone",
								imageName: "SendIcon",
								imageWidth: 79,
								imageHeight: 69,
								offsetX: 18,
								offsetY: 24,
								action: {
									path.append(Route.shippingDetail)
								}
							)
							ActionButton(
								actionName: .receive,
								description: "Collect your\nitems",
								imageName: "ReceiveIcon",
								imageWidth: 89,
								imageHeight: 86,
								offsetX: 14,
								offsetY: 30,
								action: {
									path.append(Route.receive)
								}
							)
						}
						HStack(spacing: 21) {
							ActionButton(
								actionName: .storeItems,
								description: "Store items\nin zones",
								imageName: "StoreItemsIcon",
								imageWidth: 55,
								imageHeight: 100,
								offsetX: 18,
								offsetY: 24,
								action: {
									action = .storeItems
								}
							)
							ActionButton(
								actionName: .share,
								description: "Share locker\naccess",
								imageName: "ShareIcon",
								imageWidth: 83,
								imageHeight: 83,
								offsetX: 8,
								offsetY: 24,
								action: {
									action = .share
								}
							)
						}
					}
				}
				.padding(.top, 20)
				.padding(.horizontal, 24)
				.background(getRGBColor(245, 247, 247))
    }
		.ignoresSafeArea()
  }
}

#Preview {
	HomeView(path: .constant(NavigationPath()))
}
