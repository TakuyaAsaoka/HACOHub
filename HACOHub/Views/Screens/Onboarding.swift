//
//  OnboardingView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI

struct OnboardingView: View {
  @AppStorage("hasLaunchedBefore") var hasLaunchedBefore: Bool = false
  @State private var step = 0

  var body: some View {
    ZStack {
      switch step {
        case 0:
          EnableLocationView(buttonAction: {
            step += 1
          })
      case 1:
        EnableNotificationsView(buttonAction: {
          hasLaunchedBefore = true
        })
      default:
        EmptyView()
      }
    }
    .animation(.easeInOut, value: step)
  }
}

struct BaseEnableView: View {
  let title: String
  let imageName: String
  let description: String
  let buttonText: String
  let buttonWidth: CGFloat
  let buttonAction: () -> Void

  var body: some View {
    ZStack {
      Color(getRGBColor(236, 249, 243))

      VStack(spacing: 0) {
        Text.sfProBold(title, size: 40)
          .foregroundColor(getRGBColor(110, 119, 129))
          .multilineTextAlignment(.center)
          .padding(.top, 70)
          .padding(.bottom, 24)

        Image(imageName)
          .resizable()
          .scaledToFit()
          .frame(height: 162)
          .padding(.bottom, 64)

        Text.sfProRegular(description, size: 24)
          .foregroundColor(getRGBColor(110, 119, 129))
          .multilineTextAlignment(.center)
          .padding(.bottom, 142)

        PrimaryRoundedButton(text: buttonText, action: buttonAction)
          .padding(.horizontal, 24)
      }
      .frame(maxHeight: .infinity)
    }
    .ignoresSafeArea()
  }
}

struct EnableLocationView: View {
  let buttonAction: () -> Void

  var body: some View {
    BaseEnableView(title: "Enable\nLocation", imageName: "LocationIcon", description: "To find nearby HACOHub,\nallow location access",buttonText: "Enable Location", buttonWidth: 345, buttonAction: buttonAction)
  }
}

struct EnableNotificationsView: View {
  let buttonAction: () -> Void

  var body: some View {
    BaseEnableView(title: "Enable\nNotifications", imageName: "NotificationIcon", description: "Stay informed about\nyour packages and activity",buttonText: "Allow Notifications", buttonWidth: 345, buttonAction: buttonAction)
  }
}

#Preview {
  OnboardingView()
}
