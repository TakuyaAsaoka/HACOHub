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
    
  var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
		
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
									path.append(Route.send)
								}
							)
							ZStack {
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
								
								ZStack {
									Circle()
										.fill(getRGBColor(255, 92, 92))
										.frame(width: 38, height: 38)
									Text.sfProBold("1", size: 20)
										.foregroundColor(.white)
								}
								.offset(x: 60, y: -76)
							}
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
							.disabled(true)
							.overlay(
								ZStack {
									getRGBColor(232, 231, 231, 0.8)
											.cornerRadius(16)
									VStack(spacing: 0) {
										Image("ComingSoonIcon")
											.resizable()
											.scaledToFit()
											.frame(width: 84, height: 54)
											.offset(y: 14)
										
										Text.sfProBold("Coming Soon", size: 24)
											.foregroundColor(getRGBColor(74, 85, 101, 0.8))
									}
									.offset(y: -30)
									.rotationEffect(.degrees(49))
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
							.disabled(true)
							.overlay(
								ZStack {
									getRGBColor(232, 231, 231, 0.8)
											.cornerRadius(16)
									VStack(spacing: 0) {
										Image("ComingSoonIcon")
											.resizable()
											.scaledToFit()
											.frame(width: 84, height: 54)
											.offset(y: 14)
										
										Text.sfProBold("Coming Soon", size: 24)
											.foregroundColor(getRGBColor(74, 85, 101, 0.8))
									}
									.offset(y: -30)
									.rotationEffect(.degrees(49))
								}
							)
						}
					}
					Spacer()
				}
				.padding(.top, 20)
				.padding(.horizontal, 24)
			}
    }
		.ignoresSafeArea()
  }
}

#Preview {
	HomeView(path: .constant(NavigationPath()))
}
