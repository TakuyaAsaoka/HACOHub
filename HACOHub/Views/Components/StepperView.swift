//
//  SttepperView.swift
//  HACOHub
//
//  Created by TakuyaAsaoka on 2025/10/28.
//

import SwiftUI

struct StepperView: View {
	let steps: [String]
	let completeNumber: Int

	var body: some View {
		HStack(spacing: 8) {
			ForEach(steps.indices, id: \.self) { index in
				HStack(spacing: 8) {
					if index < completeNumber {
						Image("CheckIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 24, height: 24)
					} else if index == completeNumber {
						ZStack {
							Circle()
								.stroke(getRGBColor(79, 190, 150), lineWidth: 1.5)
								.frame(width: 30, height: 30)
							Circle()
								.fill(getRGBColor(79, 190, 150))
								.frame(width: 24, height: 24)
							Text.sfProRegular("\(index + 1)", size: 12)
								.foregroundColor(.white)
						}
					} else {
						ZStack {
							Circle()
								.fill(getRGBColor(208, 215, 222))
								.frame(width: 24, height: 24)
							Text.sfProRegular("\(index + 1)", size: 12)
								.foregroundColor(.white)
						}
					}
					
					
					Group {
						if index < completeNumber {
							Text.sfProRegular(steps[index], size: 14)
						} else if index == completeNumber {
							Text.sfProMedium(steps[index], size: 14)
						} else {
							Text.sfProMedium(steps[index], size: 14)
								.foregroundColor(getRGBColor(189, 189, 189))
						}
					}
				}
				
				if index < steps.count - 1 {
					Spacer()
						.background(
							Capsule()
								.fill(getRGBColor(189, 189, 189))
								.frame(height: 1)
						)
				}
			}
		}
	}
}

#Preview {
	Stepper(
			steps: ["Locker", "Location", "Payment"],
			completeNumber: 1
	)
}
