//
//  PaymentModalView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/10.
//

import SwiftUI

struct PaymentModalView: View {
	@Binding var path: NavigationPath
	@Binding var selectedTab: Int
  @State private var isCompletedLoading = false

  @EnvironmentObject var sendStore: SendStore

  var body: some View {
    DimmedOverlayModalView(vPadding: 32) {
      ZStack {
        if !isCompletedLoading {
          VStack(spacing: 12) {
            PrimarySpinner()
            Text("Loading...")
              .font(.system(size: 24, weight: .bold))
          }
          .transition(.opacity)
        }

        if isCompletedLoading {
          VStack(spacing: 0) {
            Image("CompletedIcon")
              .resizable()
              .scaledToFit()
              .frame(width: 115.5, height: 115.5)
              .padding(.bottom, 5)
            Text.sfProBold("Reservation Confirmed", size: 24)
              .padding(.bottom, 8)
            Text.sfProRegular(
              "Check it anytime in My Locker\nfrom the Home screen",
              size: 20
            )
            .multilineTextAlignment(.center)
          }
          .transition(.opacity)
        }
      }
      .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
          withAnimation {
            sendStore.reset()
            isCompletedLoading = true
          }
        }
      }
    }
		.onTapGesture {
			if isCompletedLoading {
				withAnimation {
					selectedTab = 1
					let count = path.count
					path.removeLast(count)
				}
			}
		}
  }
}

#Preview {
  PaymentModalView(path: .constant(NavigationPath()), selectedTab: .constant(1))
    .environmentObject(SendStore())
}
