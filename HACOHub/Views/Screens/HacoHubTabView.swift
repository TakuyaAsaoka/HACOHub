//
//  HacoHubTabView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI

struct HacoHubTabView: View {
  @Binding var selectedTab: Int
  @Binding var path: NavigationPath

  var body: some View {
    VStack(spacing: 0) {
      HomeHeaderView()

      TabView(selection: $selectedTab) {
        HomeView(path: $path).tag(0)
        ActivityView(path: $path).tag(1)
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
      .animation(.easeInOut(duration: 0.25), value: selectedTab)

      VStack(spacing: 0) {
        Rectangle()
          .frame(height: 1)
          .foregroundColor(getRGBColor(208, 215, 222))

        HStack(spacing: 0) {
          Spacer()
          tabButton(index: 0, icon: "HomeIcon", label: "Home")
          Spacer()
          tabButton(index: 1, icon: "ActivityIcon", label: "Activity")
          Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(.white)
      }
    }
    .ignoresSafeArea()
  }

  private func tabButton(index: Int, icon: String, label: String) -> some View {
    Button(action: {
      withAnimation(.easeInOut) {
        selectedTab = index
      }
    }) {
      ZStack {
        Circle()
          .fill(selectedTab == index ? getRGBColor(236, 249, 243) : Color.clear)
          .frame(width: 70, height: 70)

        VStack {
          Image(icon)
            .renderingMode(.template)
            .foregroundColor(selectedTab == index ? Color.pri : getRGBColor(110, 119, 129))
          Text.sfProBold(label, size: 13)
        }
        .foregroundColor(selectedTab == index ? Color.pri : getRGBColor(110, 119, 129))
      }
    }
  }
}

#Preview {
	HacoHubTabView(
    selectedTab: .constant(1),
    path: .constant(NavigationPath())
  )
}
