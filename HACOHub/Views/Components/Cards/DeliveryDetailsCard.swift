import SwiftUI

struct DeliveryDetailsCard: View {
	var body: some View {

		Group{
			VStack(alignment: .leading, spacing: 12) {
				HStack(alignment: .top) {
					Image("TonyIcon")
						.resizable()
						.frame(width: 40, height: 40)
					
					VStack(alignment: .leading, spacing: 4) {
						Text("HACOHub")
							.font(.custom("SFPro-Regular", size: 12))
							.foregroundColor(getRGBColor(106, 114, 130, 1))
						Text("Tony")
							.font(.custom("SFPro-Regular", size: 14))
							.foregroundColor(getRGBColor(30, 41, 57, 1))
					}
					
					Spacer()
					
					VStack(alignment: .trailing, spacing: 4) {
						Text("Package Size")
							.font(.custom("SFPro-Regular", size: 12))
							.foregroundColor(getRGBColor(106, 114, 130, 1))
						Text("Small")
							.font(.custom("SFPro-Medium", size: 14))
							.foregroundColor(getRGBColor(30, 41, 57, 1))
					}
				}
				
				Divider()
					.background(getRGBColor(229, 231, 235, 1))
				
				VStack(spacing: 18){
					HStack {
						Image("GreenClockIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 12, height: 12)
						Text("Estimated delivery")
							.font(.custom("SFPro-Regular", size: 12))
							.foregroundColor(getRGBColor(74, 85, 101, 1))
						Spacer()
						Text("Today, PM5:00")
							.font(.custom("SFPro-Medium", size: 14))
							.foregroundColor(getRGBColor(30, 41, 57, 1))
					}

					HStack {
						Image("RocketIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 12, height: 12)
						Text("Express delivery - 40% faster")
							.font(.custom("SFPro-Regular", size: 12))
							.foregroundColor(getRGBColor(245, 73, 0, 1))
						Spacer()
						
					}
				}
				.padding(.vertical)
				
				Divider()
					.background(getRGBColor(229, 231, 235, 1))
			
				VStack(spacing: 8) {
					HStack(spacing: 8) {
						Image("GreenLugageIcon")
							.frame(width: 16) // アイコン幅揃え
						Text("Small")
							.font(.custom("SFPro-Regular", size: 14))
							.foregroundColor(getRGBColor(74, 85, 101, 1))
						Spacer()
						Text("$5")
							.font(.custom("SFPro-Medium", size: 16))
							.foregroundColor(getRGBColor(54, 65, 83, 1))
					}
					
					HStack(spacing: 8) {
						Image("RocketIcon")
							.frame(width: 16, height: 16)
						Text("Express Fee")
							.font(.custom("SFPro-Regular", size: 14))
							.foregroundColor(getRGBColor(74, 85, 101, 1))
						Spacer()
						Text("$3")
							.font(.custom("SFPro-Medium", size: 16))
							.foregroundColor(getRGBColor(245, 73, 0, 1))
					}
				}
				.padding(.top)
				
				HStack {
					Text("Total")
						.font(.custom("SFPro-Regular", size: 14))
						.foregroundColor(getRGBColor(54, 65, 83, 1))
					Spacer()
					Text("$8")
						.font(.custom("SFPro-Medium", size: 24))
						.foregroundColor(getRGBColor(79, 190, 159, 1))
				}
			}
			.padding(.horizontal, 16)
			.padding(.vertical, 16)
		}
		.background(
			RoundedRectangle(cornerRadius: 20)
				.fill(getRGBColor(236, 249, 243, 1))
				.shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
				.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1))
		
	}
}

#Preview {
	DeliveryDetailsCard()
}
