//
//  ConfirmView.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI

struct ConfirmView: View {
	let steps: [String] = [
		"Shipping\ndetail",
		"Delivery\ndetail",
		"Select\na HACOHub",
	]
	@State var isShowingPayment: Bool = false
	@State var isComfirmed: Bool = false
	
	var body: some View {
		ZStack {
			VStack(alignment: .leading, spacing: 0) {
				ConfirmContentView()
				
				PrimaryRoundedButton(
					text: "Confirm & Pay",
					weight: .bold,
					size: 20,
					vPadding: 20,
					radius: 16,
					action: {
						isShowingPayment = true
					}
				)
				.padding(.horizontal, 24)
				.padding(.top, 24)
				.padding(.bottom, 36)
				.background(.white)
			}
			
			if isShowingPayment { PaymentModalView(isConfirmed: $isComfirmed) }
		}
		.navigationTitle("Send")
		.navigationDestination(isPresented: $isComfirmed) {
			ConfirmSuccessView()
		}
	}
}

struct ConfirmContentView: View {
	@State private var selectedRadioButtonPaymentId: UUID? = nil

	var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
			
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading, spacing: 8) {
					Text.sfProRegular("Delivery Details", size: 16)
						.foregroundColor(getRGBColor(54, 65, 83))
				
					VStack {
						Image("TonyCard")
							.resizable()
							.scaledToFit()
							.frame(maxWidth: .infinity)
						
						Image("ShippingCard")
							.resizable()
							.scaledToFit()
							.frame(maxWidth: .infinity)
					}
					
					Text.sfProRegular("Choose payment method", size: 16)
						.foregroundColor(getRGBColor(54, 65, 83))
					
					PrimaryRadioButtonGrid(
						selectedItem: $selectedRadioButtonPaymentId,
						buttons: paymentButtons,
						alignment: .leading,
						columns: 3,
						height: 40,
						width: 85,
						vSpacing: 0,
						hSpacing: 7
					)
					.padding(2)
				}
			}
			.padding(.vertical, 20)
			.padding(.horizontal, 20)
		}
	}
}

#Preview {
    ConfirmView()
}
