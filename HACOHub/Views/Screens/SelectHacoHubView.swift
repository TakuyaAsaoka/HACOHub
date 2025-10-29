//
//  SelectHacoHubView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct SelectHacoHubView: View {
	@State private var selectedSize: String = "Small"
	@State private var isExpress: Bool = false
	
	var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
			
			VStack (alignment: .leading, spacing: 8) {
				Text.sfProRegular("Select Size", size: 16)
					.foregroundColor(getRGBColor(54, 65, 83))
				
				VStack (spacing: 12) {
					HacoHubOptionView(
						cost: 5,
						imageName: "SmallIcon",
						size: "Small",
						sizeDescription: "12'W×15'D×15'H",
						description: "Shopping bag / Tote bag",
						selectedSize: $selectedSize
					)
					HacoHubOptionView(
						cost: 8,
						imageName: "MediumIcon",
						size: "Medium",
						sizeDescription: "15'W×18'D×18'H",
						description: "Backpack / Weekend bag",
						selectedSize: $selectedSize
					)
					HacoHubOptionView(
						cost: 12,
						imageName: "LargeIcon",
						size: "Large",
						sizeDescription: "18'W×20'D×24'H",
						description: "Carry-onsuitcase",
						selectedSize: $selectedSize
					)
				}
				
				Text.sfProRegular("Select option", size: 16)
				
				Button {
					isExpress.toggle()
				} label: {
					HStack(spacing: 16) {
						Image(isExpress ? "OrangeCheckIcon" : "OrangeNotCheckIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 18, height: 18)
						
						VStack(alignment: .leading, spacing: 4) {
							Text.sfProMedium("Express delivery (+3)", size: 16)
							Text.sfProRegular("Get your item delivered faster", size: 12)
								.foregroundColor(getRGBColor(106, 114, 130))
						}
						Spacer()
						Text.sfProBold("+$3", size: 24)
					}
					.padding(.horizontal, 16)
					.padding(.vertical, 8)
					.background(
						RoundedRectangle(cornerRadius: 14)
							.fill(isExpress ? getRGBColor(255, 241, 224) : Color.white) // 薄緑 or 白
					)
					.overlay(
						RoundedRectangle(cornerRadius: 14)
							.stroke(isExpress ? getRGBColor(255, 172, 71) : getRGBColor(208, 215, 222), lineWidth: 2) // 緑 or グレー
					)
					.cornerRadius(14)
				}
				.buttonStyle(.plain)
				Spacer()
			}
			.padding(.horizontal, 18)
			.padding(.top, 20)
		}
	}
}

struct HacoHubOptionView: View {
	let cost: Int
	let imageName: String
	let size: String
	let sizeDescription: String
	let description: String
	@Binding var selectedSize: String
	
	var body: some View {
		Button {
			selectedSize = size
		} label: {
			HStack(spacing: 8) {
				Image(imageName)
					.resizable()
					.scaledToFit()
					.frame(width: 50, height: 50)
				
				VStack(alignment: .leading, spacing: 7) {
					HStack(spacing: 30) {
						Text.sfProBold(size, size: 20)
							.foregroundColor(getRGBColor(36, 41, 47))
						Text.sfProRegular(sizeDescription, size: 14)
					}
					Text.sfProRegular(description, size: 12)
						.foregroundColor(getRGBColor(36, 41, 47))
				}
				
				Spacer()
				
				Text.sfProBold("$\(cost)", size: 24)
			}
			.padding(.horizontal, 20)
			.padding(.vertical, 16)
			.background(
					RoundedRectangle(cornerRadius: 8)
						.fill(selectedSize == size ? getRGBColor(236, 249, 243) : Color.white) // 薄緑 or 白
			)
			.overlay(
				RoundedRectangle(cornerRadius: 8)
					.stroke(selectedSize == size ? getRGBColor(79, 190, 159) : getRGBColor(208, 215, 222), lineWidth: 1) // 緑 or グレー
			)
			.cornerRadius(8)
			.shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 2)
		}
		.buttonStyle(PlainButtonStyle())
	}
}

struct LayoutSelectHacoHubView: View {
	let steps: [String] = [
		"Shipping\ndetail",
		"Delivery\ndetail",
		"Select\na HACOHub",
	]
	@State var isShowingConfirmView: Bool = false
	
	var body: some View {
		PhaseLayoutView(
			steps: steps,
			completeNumber: 2,
			content: {
				SelectHacoHubView()
			},
			buttonText: "Next",
			action: {
				isShowingConfirmView = true
			}
		)
		.navigationTitle("Send")
		.navigationDestination(isPresented: $isShowingConfirmView) {
			ConfirmView()
		}
	}
}

#Preview {
	SelectHacoHubView()
}
