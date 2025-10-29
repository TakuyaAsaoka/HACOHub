//
//  ConfirmSuccessView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct ConfirmSuccessView: View {
	@State var isShowingQR: Bool = false
	
	var body: some View {
		ZStack {
			VStack(alignment: .leading, spacing: 0) {
				ConfirmSuccessContentView()
				
				PrimaryRoundedButton(
					text: "Scan a QR Code",
					weight: .bold,
					size: 20,
					vPadding: 20,
					radius: 16,
					action: {
						isShowingQR = true
					}
				)
				.padding(.horizontal, 24)
				.padding(.top, 24)
				.padding(.bottom, 36)
				.background(.white)
			}
			
			if isShowingQR { ScanModalView(
				isPresented: $isShowingQR
			) }
		}
		.navigationTitle("Send")
//		.navigationDestination(isPresented: $isComfirmed) {
//			ConfirmSuccessView()
//		}
	}
}

struct ConfirmSuccessContentView: View {
	var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
			
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading, spacing: 8) {
					Text.sfProRegular("Shipping location", size: 16)
						.foregroundColor(getRGBColor(54, 65, 83))
					
					Image("ShippingLocationMap")
						.resizable()
						.scaledToFit()
						.frame(maxWidth: .infinity)
				
					Text.sfProRegular("Delivery Details", size: 16)
						.foregroundColor(getRGBColor(54, 65, 83))
					
					VStack {
						Image("TonySuccessCard")
							.resizable()
							.scaledToFit()
							.frame(maxWidth: .infinity)
						
						Image("ShippingSuccessCard")
							.resizable()
							.scaledToFit()
							.frame(maxWidth: .infinity)
					}
				}
			}
			.padding(.vertical, 20)
			.padding(.horizontal, 20)
		}
	}
}

#Preview {
    ConfirmSuccessView()
}
