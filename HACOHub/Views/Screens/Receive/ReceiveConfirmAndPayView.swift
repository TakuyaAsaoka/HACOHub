//
//  ReceiveConfirmAndPay.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/30.
//

import SwiftUI

struct ReceiveConfirmAndPayView: View {
  @Binding var path: NavigationPath
	@Binding var selectedTab: Int
	@EnvironmentObject var receiveStore: ReceiveStore
  @State private var selectedRadioButtonPaymentId: UUID? = nil
  @State var isShowingPayment: Bool = false

	var body: some View {
    ZStack {
      getRGBColor(245, 247, 247)

      VStack(spacing: 0) {
        NormalHeader(path: $path, title: "Receive Confirmation")

        VStack(alignment: .leading, spacing: 16) {
          VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
              Image("GreenPinIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)

              VStack(alignment: .leading) {
                Text.sfProRegular("Location", size: 12)
                  .foregroundColor(getRGBColor(106, 114, 130))
                Text.sfProRegular(
                  receiveStore.location ?? "Not available",
                  size: 16
                )
                .foregroundColor(
                  receiveStore.location == nil
                  ? Color.gray.opacity(0.5)
                  : getRGBColor(36, 41, 47)
                )
              }
            }

            HStack(spacing: 12) {
              Image("GreenUserIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)

              VStack(alignment: .leading) {
                Text.sfProRegular("HACOHub Vehicle", size: 12)
                  .foregroundColor(getRGBColor(106, 114, 130))
                Text.sfProMedium("Stark", size: 16)
              }
            }

            HStack(spacing: 12) {
              Image("GreenCalenderIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)

              VStack(alignment: .leading) {
                Text.sfProRegular("Date & Time", size: 12)
                  .foregroundColor(getRGBColor(106, 114, 130))
                Text.sfProMedium(formatDateWithAMPM(receiveStore.date), size: 16)
              }
            }

            HStack(spacing: 12) {
              Image("GreenLugageIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)

              VStack(alignment: .leading) {
                Text.sfProRegular("Locker Size", size: 12)
                  .foregroundColor(getRGBColor(106, 114, 130))
                Text.sfProMedium(receiveStore.size, size: 16)
              }
            }
          }
          .padding(24)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(.white)
          .cornerRadius(14)
          .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
          .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)


          HStack(spacing: 0) {
            Text.sfProRegular("Total Free", size: 16)
              .foregroundColor(getRGBColor(54, 65, 83))
            Spacer()
            Text.sfProRegular("$0", size: 24)
              .foregroundColor(Color.pri)
          }
          .padding(24)
          .background(getRGBColor(227, 240, 237))
          .cornerRadius(14)
          .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
          .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 1)

          Text.sfProRegular("Choose payment method", size: 16)
            .foregroundColor(getRGBColor(36, 41, 47))

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
        }
        .padding(20)

        Spacer()

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
        .padding(.top, 24)
        .padding(.bottom, 36)
        .padding(.horizontal, 24)
        .background(.white)
      }

      if isShowingPayment {
        PaymentModalView(
          path: $path,
          selectedTab: $selectedTab,
          action: {}
        )
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  ReceiveConfirmAndPayView(
    path: .constant(NavigationPath()),
    selectedTab: .constant(2)
  )
    .environmentObject(ReceiveStore())
}
