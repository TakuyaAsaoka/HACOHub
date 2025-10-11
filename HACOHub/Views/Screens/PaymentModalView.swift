//
//  PaymentModalView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/10.
//

import SwiftUI

struct PaymentModalView: View {
  @State private var isCompletedLoading = false

  var body: some View {
    DimmedOverlayModalView(vPadding: 32) {
      ZStack {
        // Loading
        if !isCompletedLoading {
          VStack(spacing: 12) {
            PrimarySpinner()
            Text("Loading...")
              .font(.system(size: 24, weight: .bold))
          }
          .transition(.opacity)
        }

        // Completed
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
            isCompletedLoading = true
          }
        }
      }
    }
  }
}

#Preview {
    PaymentModalView()
}
