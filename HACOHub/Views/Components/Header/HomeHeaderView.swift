//
//  HomeHeaderView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/11.
//

import SwiftUI

struct HomeHeaderView: View {
	@State var isShowingAlert: Bool = false
	@State var isShowingComingSoon: Bool = false
	
  var body: some View {
		VStack(spacing: 16) {
      HStack(alignment: .bottom) {
//				Button {
//					isShowingAlert.toggle()
//					isShowingComingSoon = true
//				}	label: {
					Text.sfProBold("HACOHub", size: 32)
						.foregroundColor(getRGBColor(79, 190, 159))
//				}
        Spacer()
        Button {
					isShowingComingSoon = true
				} label: {
          Image("AlartIcon")
        }
      }
			
			if isShowingAlert {
				HStack(spacing: 10) {
					Image("GreenExclamationIcon")
						.resizable()
						.scaledToFit()
						.frame(width: 30, height: 30)
					VStack(alignment: .leading, spacing: 4) {
						Text.sfProMedium("It's almost pickup time!", size: 16)
							.foregroundColor(getRGBColor(36, 41, 47))
						Text.sfProMedium("Tap to open the map and pick up your items.", size: 12)
							.foregroundColor(getRGBColor(36, 41, 47))
					}
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding(.vertical, 14)
				.padding(.leading, 16)
				.background(getRGBColor(236, 249, 243))
				.overlay(
					RoundedRectangle(cornerRadius: 16)
						.stroke(getRGBColor(79, 190, 159), lineWidth: 1)
				)
				.cornerRadius(16)
			}
    }
		.padding(.horizontal, 20)
		.padding(.top, 72)
    .padding(.bottom, 8)
    .background(.white)
		.navigationDestination(isPresented: $isShowingComingSoon) {
			ComingSoonView()
		}
  }
}

#Preview {
  ZStack {
    Color.gray
    VStack {
      HomeHeaderView()
      Spacer()
    }
  }
  .ignoresSafeArea()
}
