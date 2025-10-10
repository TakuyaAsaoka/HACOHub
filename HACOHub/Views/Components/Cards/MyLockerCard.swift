//
//  MyLockerCard.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/10.
//

import SwiftUI

struct MyLockerCard: View {
  @State var isShowingDetails: Bool = false
  let myLocker: MyLocker

  var body: some View {
    Button {
      isShowingDetails.toggle()
    } label: {
      VStack(alignment: .leading, spacing: 8) {
        HStack {
          StatusView(status: myLocker.status)
          Spacer()
          DailyRateView(dailyRate: myLocker.dailyRate)
        }

        HStack(alignment: .bottom, spacing: 8) {
          Text.sfProMedium("Size", size: 16)
            .frame(width: 67, alignment: .leading)
            .foregroundColor(getRGBColor(110, 119, 129))
          Text.sfProBold(myLocker.size.rawValue, size: 20)
          Text.sfProRegular("34×57×42 cm", size: 14)
        }

        HStack(spacing: 8) {
          Text.sfProMedium("Location", size: 16)
            .frame(width: 67, alignment: .leading)
            .foregroundColor(getRGBColor(110, 119, 129))
          Text.sfProRegular("Sweet Auburn Music Fest Entrance", size: 14)
        }

        HStack(spacing: 8) {
          Text.sfProMedium("Time", size: 16)
            .frame(width: 67, alignment: .leading)
            .foregroundColor(getRGBColor(110, 119, 129))
          Text.sfProRegular(fromDateToFullDate(date: myLocker.time), size: 14)
        }
        .padding(.bottom, 3)


        switch myLocker.status {
          case .reserved:
            ReservedDetailsView(isShowingDetails: isShowingDetails)
          case .inUse:
            InUseDetailsView(isShowingDetails: isShowingDetails)
          case .completed:
            CompletedDetailsView(isShowingDetails: isShowingDetails)
        }
      }
      .padding(.vertical, 12)
      .padding(.horizontal, 20)
      .background(.white)
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .stroke(
            myLocker.status == .inUse
            ? getRGBColor(79, 190, 159)
            : getRGBColor(208, 215, 222),
            lineWidth: myLocker.status == .inUse ? 2 : 1
          )
      )
      .cornerRadius(16)
      .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
    .buttonStyle(.plain)
  }
}

struct StatusView: View {
  let status: LockerStatus

  var body: some View {
    switch status {
      case .reserved:
      Text.sfProRegular("Reserved", size: 16)
        .foregroundColor(getRGBColor(79, 190, 159))
        .padding(.vertical, 3)
        .padding(.horizontal, 12)
        .overlay(
          RoundedRectangle(cornerRadius: 24)
            .stroke(getRGBColor(79, 190, 159), lineWidth: 1)
        )
      case .inUse:
      Text.sfProRegular("In Use", size: 16)
        .foregroundColor(.white)
        .padding(.vertical, 3)
        .padding(.horizontal, 12)
        .background(
          RoundedRectangle(cornerRadius: 24)
            .fill(getRGBColor(79, 190, 159))
        )
      case .completed:
        Text("Completed")
        .foregroundColor(.white)
        .padding(.vertical, 3)
        .padding(.horizontal, 12)
        .background(
          RoundedRectangle(cornerRadius: 24)
            .fill(getRGBColor(175, 184, 193))
        )
    }
  }
}

struct DailyRateView: View {
   let dailyRate: Double

  var body: some View {
    HStack {
      Text.sfProBold(formattedRate, size: 20)
      Text.sfProRegular("/day", size: 20)
    }
    .foregroundColor(getRGBColor(31, 153, 0))
  }

  private var formattedRate: String {
    if dailyRate.truncatingRemainder(dividingBy: 1) == 0 {
      return "$\(Int(dailyRate))"
    } else {
      return String(format: "$%.2f", dailyRate)
    }
  }
}

struct ReservedDetailsView: View {
  let isShowingDetails: Bool

  var body: some View {
    if isShowingDetails {
      VStack(spacing: 16) {
        Divider()
        HStack {
          Text.sfProBold("4h 11m", size: 32)
          Text.sfProRegular("Remaining", size: 32)
        }
      VStack(spacing: 12) {
        PrimaryRoundedButton(
          text: "Open Locker",
          weight: .regular,
          size: 16,
          vPadding: 10,
          radius: 11,
          action: {}
        )
          .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)

        WhiteRoundedButton(
          text: "Edit Reservation",
          color: .black,
          weight: .regular,
          size: 16,
          vPadding: 10,
          radius: 11,
          action: {}
        )

        WhiteRoundedButton(
          text: "Cancel Reservation",
          color: getRGBColor(248, 63, 63),
          weight: .regular,
          size: 16,
          vPadding: 10,
          radius: 11,
          action: {}
        )
      }
    }
    } else {
      HStack {
        Spacer()
        Text.sfProRegular("View Details", size: 14)
          .foregroundColor(getRGBColor(0, 122, 255))
      }
    }
  }
}

struct InUseDetailsView: View {
  let isShowingDetails: Bool

  var body: some View {
    if isShowingDetails {
      VStack(alignment: .leading, spacing: 0) {
        Divider()
          .padding(.bottom, 11)
        HStack {
          VStack(alignment: .leading) {
            Text.sfProMedium("Elapsed Time", size: 16)
              .foregroundColor(getRGBColor(110, 119, 129))
              .padding(.bottom, 2)
            Text.sfProBold("01:22:15", size: 40)
              .padding(.bottom, 11)

            Text.sfProMedium("Started", size: 16)
              .foregroundColor(getRGBColor(110, 119, 129))
            Text.sfProBold("13:21", size: 32)
              .padding(.bottom, 11)
          }
        }
        Text.sfProRegular("Increase screen brightness for easier scanning.", size: 14)
        Text.sfProRegular("Contact: +1-XX-XXXX-XXXX", size: 14)
          .padding(.bottom, 25)

        PrimaryRoundedButton(
          text: "Schedule Pickup",
          weight: .regular,
          size: 16,
          vPadding: 10,
          radius: 11,
          action: {}
        )
      }
    } else {
      HStack {
        Spacer()
        Text.sfProRegular("View Details", size: 14)
          .foregroundColor(getRGBColor(0, 122, 255))
      }
    }
  }
}

struct CompletedDetailsView: View {
  let isShowingDetails: Bool

  var body: some View {

  }
}

#Preview {
  VStack {
    MyLockerCard(
      myLocker: MyLocker(
        status: LockerStatus.reserved,
        size: LockerSize.small,
        locatin: "Sweet Auburn Music Fest Entrance",
        time: Date(),
        dailyRate: 4.0
      )
    )
    MyLockerCard(
      myLocker: MyLocker(
        status: LockerStatus.inUse,
        size: LockerSize.medium,
        locatin: "Sweet Auburn Music Fest Entrance",
        time: Date(),
        dailyRate: 4.05
      )
    )
    MyLockerCard(
      myLocker: MyLocker(
        status: LockerStatus.completed,
        size: LockerSize.large,
        locatin: "Sweet Auburn Music Fest Entrance",
        time: Date(),
        dailyRate: 4.05
      )
    )
  }
}
