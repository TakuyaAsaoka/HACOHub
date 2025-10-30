//
//  Your.swift
//  HACOHub
//
//  Created by RIKI on 2025/10/30.
//
import SwiftUI

struct YourItemCard: View {
	var body: some View {
		
		ZStack(alignment: .leading){
			RoundedRectangle(cornerRadius: 14)
			
				.fill(
					LinearGradient(
						gradient: Gradient(stops: [
							.init(color: Color.white, location: 0.0),                       // 左上端
							.init(color: getRGBColor(79, 190, 159, 0.5), location: 0.5),   // 中央が濃い
							.init(color: getRGBColor(79, 190, 159, 0.05), location: 1.0)   // 右下端
						]),
						startPoint: .topLeading,
						endPoint: .bottomTrailing
					)
				)
				.shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
				.shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
			
			VStack{
				HStack(spacing: 12){
					Image("Iphone20Icon")
						.resizable()
						.scaledToFit()
						.frame(width: 48, height: 48)
					
					VStack(alignment: .leading, spacing: 9) {
						Text.sfProRegular("From Amazon", size: 12)
							.foregroundColor(getRGBColor(106, 114, 130, 1))
						Text("iPhone 20")
							.font(.custom("SFPro-Regular", size: 14))
							.foregroundColor(getRGBColor(30, 41, 57, 1))
						
						ZStack{
							RoundedRectangle(cornerRadius: 4)
								.fill(getRGBColor(79, 190, 159, 0.2))
								.frame(width: 48, height: 24)
							
							Text.sfProRegular("Small", size: 12)
								.foregroundColor(getRGBColor(79, 190, 159, 1))
							
						}
						
					}
					Spacer()
				}
				Spacer()
				
				ZStack(alignment: .leading){
					RoundedRectangle(cornerRadius: 10)
						.frame(width: 286, height: 32, alignment: .leading)
						.foregroundColor(getRGBColor(255, 255, 255, 0.5))
					HStack{
						Image("GreenLugageIcon")
							.resizable( )
							.scaledToFit()
							.frame(width: 14, height: 14)
							.padding(.leading,8)
						Text.sfProRegular("Shipping No.:EC119214", size: 12)
							.foregroundColor(getRGBColor(106, 114, 130, 1))
						
						Spacer()
					}
					.frame(width:286,height: 32)
					
					
				}
				.padding(.bottom,20)
				.frame(maxWidth: .infinity, alignment: .leading)
				
				
				
			}
		}
		.frame(height: 188)
		
		
	}
}


#Preview {
	YourItemCard()
}

