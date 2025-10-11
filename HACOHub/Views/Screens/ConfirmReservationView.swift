//
//  ConfirmReservationView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/09.
//

import SwiftUI

struct ConfirmReservationView: View {
  @Binding var selectedEvent: EventInfo?
  @Binding var selectedSize: LockerSize?
  @Binding var selectedTime: Date
  @Binding var selectedPayment: Payment?

  @State private var isShowingPaymentModalView = false

  var body: some View {
    ZStack {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 4) {
          Text.sfProRegular("Event", size: 16)
            .padding(.bottom, 4)
          Text.sfProBold(selectedEvent!.title, size: 24)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text.sfProRegular("Size", size: 16)
            .padding(.bottom, 4)
          HStack(alignment: .bottom, spacing: 45) {
            Text.sfProBold(selectedSize!.rawValue, size: 24)
            Text.sfProRegular(selectedSize?.inches ?? "", size: 14)
          }
        }

        VStack(alignment: .leading, spacing: 4) {
          Text.sfProRegular("Location", size: 16)
            .padding(.bottom, 4)
          Text.sfProBold("Outdoor Plaza", size: 24)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text.sfProRegular("Date", size: 16)
            .padding(.bottom, 4)
          HStack(spacing: 20) {
            Text.sfProBold("\(selectedEvent!.fullDate)", size: 24)
            Text.sfProBold(fromDateToFormattedDate(date: selectedTime), size: 24)
          }
        }

        VStack(alignment: .leading, spacing: 4) {
          Text.sfProRegular("Payment", size: 16)
            .padding(.bottom, 4)
          SelectedPaymentIconView(selectedPayment: selectedPayment)
        }
        .padding(.bottom, 40)

        VStack(spacing: 8) {
          HStack {
            Text.sfProMedium("Total", size: 24)
            Spacer()
          }
          Divider()
          HStack {
            Spacer()
            Text.sfProBold(selectedSize!.price.description, size: 40)
          }
        }

        Spacer()

        PrimaryRoundedButton(
          text: "Confirm & Pay",
          weight: .bold,
          size: 20,
          vPadding: 20,
          radius: 16,
          action: {
            isShowingPaymentModalView = true
        })
        .padding(.bottom, 12)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .padding(.horizontal, 20)
      .navigationTitle("Confirm Reservation")

      if isShowingPaymentModalView {
        PaymentModalView()
      }
    }
  }
}

struct SelectedPaymentIconView: View {
  let selectedPayment: Payment?
  let imageName: String

  init(selectedPayment: Payment?) {
    self.selectedPayment = selectedPayment
    self.imageName = selectedPayment?.whiteImageName ?? "WhiteApplePayIcon"
  }

  var body: some View {
    Group {
      Image(imageName)
        .resizable()
        .scaledToFit()
        .frame(width: selectedPayment?.imageWidth)
    }
    .frame(width: 85, height: 40)
    .background(
      RoundedRectangle(cornerRadius: 8)
        .fill(getRGBColor(19, 20, 38))
    )
    .overlay(
      RoundedRectangle(cornerRadius: 8)
        .stroke(getRGBColor(110, 119, 129), lineWidth: 1)
    )
  }
}

#Preview {
  @Previewable @State var selectedEvent: EventInfo? = EventInfo(
    title: "Autumn Sound Festival",
    imageName: "AutumnSoundFestival",
    date: "Oct 15",
    fullDate: "October 15, 2025",
    time: "10:00~17:00",
    place: "Sweet Auburn Music Fest",
    features: [EventFeature.ticket, EventFeature.bagStorage, EventFeature.food, EventFeature.vip, EventFeature.goods],
    availableLockers: 22,
    totalLockers: 24
  )
  @Previewable @State var selectedSize: LockerSize? = .medium
  @Previewable @State var selectedTime: Date = Date()
  @Previewable @State var selectedPayment: Payment? = .payPal

  ConfirmReservationView(
    selectedEvent: $selectedEvent,
    selectedSize: $selectedSize,
    selectedTime: $selectedTime,
    selectedPayment: $selectedPayment
  )
}
