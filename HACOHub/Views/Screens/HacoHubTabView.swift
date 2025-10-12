//
//  HacoHubTabView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI

struct HacoHubTabView: View {
  @State private var selectedTab: Int = 0

  var body: some View {
    VStack(spacing: 0) {
      Group {
        switch selectedTab {
          case 0: HomeView()
          case 1: ServicesView()
          case 2: MapView()
          case 3: MyLockerView()
          case 4: AccountView()
          default: HomeView()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .transition(.opacity)
      .animation(.easeInOut(duration: 0.2), value: selectedTab)

      VStack(spacing: 0) {
        Rectangle()
          .frame(height: 1)
          .foregroundColor(getRGBColor(208, 215, 222))

        HStack {
          tabButton(index: 0, icon: "HomeIcon", label: "Home")
          tabButton(index: 1, icon: "ServicesIcon", label: "Services")

          Button(action: {
            selectedTab = 2
          }) {
            if selectedTab == 2 {
              Image("PrimaryMapIcon")
            } else {
              Image("GrayMapIcon")
            }
          }
          .offset(y: -6)

          tabButton(index: 3, icon: "MyLockerIcon", label: "My Locker")
          tabButton(index: 4, icon: "AccountIcon", label: "Account")
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 16)
        .background(.white)
      }
    }
    .ignoresSafeArea()
  }

  private func tabButton(index: Int, icon: String, label: String) -> some View {
    Button(action: {
      selectedTab = index
    }) {
      ZStack {
        Circle()
          .fill(selectedTab == index ? getRGBColor(236, 249, 243) : Color.clear)
          .frame(width: 70, height: 70)

        VStack {
          Image(icon)
            .renderingMode(.template)
            .foregroundColor(selectedTab == index ? getRGBColor(79, 190, 159) : getRGBColor(110, 119, 129))
          Text.sfProBold(label, size: 13)
        }
        .foregroundColor(selectedTab == index ? getRGBColor(79, 190, 159) : getRGBColor(110, 119, 129))
      }
    }
  }
}

#Preview {
    HacoHubTabView()
}
