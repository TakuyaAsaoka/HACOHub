//
//  ReserveLockerView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/05.
//

import SwiftUI

struct ReserveLockerView: View {
  @Binding var selectedEvent: EventInfo?
  @State private var selectedRadioButtonSizeId: UUID? = nil
  @State private var selectedRadioButtonPaymentId: UUID? = nil
  @State private var selectedSize: LockerSize?
  @State private var selectedTime: Date = Date()
  @State private var isShowingPicker = false
  @State private var isShowingConfirmReservationView: Bool = false

  var body: some View {
    if selectedEvent == nil {
      ProgressView("Loading…")
    } else {
      VStack(alignment: .leading, spacing: 6) {
        VStack(alignment: .leading, spacing: 0) {
          Text.sfProBold(selectedEvent!.title, size: 20)
          Text.sfProRegular(selectedEvent!.place, size: 12)
            .foregroundColor(getRGBColor(66, 74, 83))
            .padding(.bottom, 8)
          HStack {
            Text.sfProRegular("\(selectedEvent!.date) \(selectedEvent!.time)", size: 16)
          }
          EventIconView(iconNames: getIconNames(features: selectedEvent!.features))
        }
        .padding(.horizontal, 20)

        Divider()
          .foregroundColor(getRGBColor(208, 215, 222))

        VStack(alignment: .leading, spacing: 0) {
          HorizontalTabView(tabs: selectedEvent!.features)
            .padding(.bottom, 8)

          Text.sfProRegular("Size", size: 16)
            .padding(.bottom, 4)
          PrimaryRadioButtonGrid(selectedItem: $selectedRadioButtonSizeId,
                                 buttons: sizeButtons,
                                 alignment: .center,
                                 columns: 3,
                                 height: 57,
                                 width: 100,
                                 vSpacing: 0,
                                 hSpacing: 26.5)
          .padding(.bottom, 12)

          HStack {
            Text.sfProRegular("Location", size: 16)
            Spacer()
            HStack {
              Image("MapIcon")
              Text.sfProRegular("View a map", size: 12)
            }
          }
          .padding(.bottom, 2)
          Image("EventMap")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .padding(.bottom, 12)

          Text.sfProRegular("Time", size: 16)
            .padding(.bottom, 4)
          HStack (spacing: 16) {
            Image("ClockIcon")
              .padding(.leading, 12)
            VStack(alignment: .leading) {
              Text.sfProRegular("Date", size: 12)
                .foregroundColor(getRGBColor(110, 119, 129))
              Text.sfProRegular(selectedEvent!.fullDate, size: 20)

            }
            VStack(alignment: .leading) {
              Text.sfProRegular("Time", size: 12)
                .foregroundColor(getRGBColor(110, 119, 129))
              TimePickerView(textSize: 20, selectedTime: $selectedTime)
            }
            .padding(.leading, 12)
            .padding(.vertical, 9)
          }
          .frame(maxWidth: .infinity, minHeight: 56, alignment: .leading)
          .overlay(
            RoundedRectangle(cornerRadius: 8)
              .stroke(getRGBColor(110, 119, 129), lineWidth: 1)
          )
          .padding(.bottom, 12)

          Text.sfProRegular("Payment", size: 16)
            .padding(.bottom, 4)
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

          Spacer()

          PrimaryRoundedButton(
            text: "Next",
            weight: .bold,
            size: 20,
            vPadding: 20,
            radius: 16,
            action: {
            if let selectedButton = sizeButtons.first(where: { $0.id == selectedRadioButtonSizeId }) {
              selectedSize = LockerSize.fromText(selectedButton.text ?? "")
            }

            isShowingConfirmReservationView = true
          })
          .padding(.bottom, 12)
        }
        .padding(.horizontal, 20)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .navigationDestination(isPresented: $isShowingConfirmReservationView, destination: {
        ConfirmReservationView(
          selectedEvent: $selectedEvent,
          selectedSize: $selectedSize,
          selectedTime: $selectedTime)
        }
      )
      .navigationTitle("Reservation")
    }
  }
}

#Preview {
  ReserveLockerView(
    selectedEvent: .constant(
      EventInfo(title: "Autumn Sound Festival",
                imageName: "AutumnSoundFestival",
                date: "Oct 15",
                fullDate: "October, 15, 2025",
                time: "10:00~17:00",
                place: "Sweet Auburn Music Fest",
                features: [EventFeature.ticket, EventFeature.bagStorage, EventFeature.food, EventFeature.vip, EventFeature.goods],
                availableLockers: 22,
                totalLockers: 24)
    )
  )
}
