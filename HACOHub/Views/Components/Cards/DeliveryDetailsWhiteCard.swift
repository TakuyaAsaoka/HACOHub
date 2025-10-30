//
//  DeliveryDetailsWhiteCard.swift
//  HACOHub
//
//  Created by RIKI on 2025/10/30.
//
import SwiftUI

struct DeliveryDetailsWhiteCard: View {
		var body: some View {
				ZStack{
						
						RoundedRectangle(cornerRadius: 14)
								.fill(getRGBColor(255, 255, 255, 1))
								.shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
								.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
								
						
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
												
												Text.sfProRegular("101 Piedmont Ave SE, Atlanta, GA", size: 16)
														.foregroundColor(getRGBColor(36, 41, 47, 1))
										}
										
								}
								
								HStack(alignment: .top, spacing: 12) {
										Image("GreenHouseIcon")
												.resizable()
												.frame(width: 20, height: 20)
												.padding(.top, 5)
										
										VStack(alignment: .leading, spacing: 0) {
												Text.sfProRegular("Recipient Information", size: 12)
														.foregroundColor(getRGBColor(106, 114, 130, 1))
												
												ZStack(alignment: .leading) {
														RoundedRectangle(cornerRadius: 14)
																.fill(getRGBColor(255, 255, 255, 1))
																.stroke(getRGBColor(208, 215, 222, 1), lineWidth: 1.85)
														
														VStack(alignment: .leading, spacing: 0) {
																Text.sfProMedium("Aisha Khan", size: 16)
																		.foregroundColor(getRGBColor(36, 41, 47, 1))
																		.padding(.top, 9)
																
																Spacer().frame(height: 10)
																
																Text.sfProRegular("Address", size: 14)
																		.foregroundColor(getRGBColor(106, 114, 130, 1))
																
																Text.sfProRegular("210 Peachtree St NW, Atlanta, GA\n30303", size: 14)
																		.foregroundColor(getRGBColor(36, 41, 47, 1))
																
																Spacer().frame(height: 15)
																
																Text.sfProRegular("Phone Number", size: 14)
																		.foregroundColor(getRGBColor(106, 114, 130, 1))
																
																Text.sfProRegular("+1 (404) 555 - 0476", size: 14)
																		.foregroundColor(getRGBColor(36, 41, 47, 1))
														}
														.padding(.horizontal, 16)
												}
												
												.padding(.top, 5)
										}
								}
						}
						.padding(.horizontal, 24)
				}
				
		}
}
#Preview {
		DeliveryDetailsWhiteCard()
}

