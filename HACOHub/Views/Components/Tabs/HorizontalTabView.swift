//
//  HorizontalTabView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/07.
//

import SwiftUI

struct HorizontalTabView: View {
  let tabs: [EventFeature]
  @State private var selectedTab: EventFeature

  init(tabs: [EventFeature]) {
    self.tabs = tabs
    _selectedTab = State(initialValue: tabs.first!)
  }

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 22) {
        ForEach(tabs) { tab in
          Button {
            selectedTab = tab
          } label: {
            Text.sfProRegular(tab.rawValue, size: 16)
              .frame(width: 100, height: 40)
              .foregroundColor(selectedTab == tab ? getRGBColor(36, 41, 47) : getRGBColor(110, 119, 129))
              .overlay(
                Rectangle()
                  .frame(height: 1)
                  .foregroundColor(selectedTab == tab ? getRGBColor(79, 190, 159) : .clear)
                  .padding(.top, 38)
              )
          }
        }
      }
    }
  }
}

#Preview {
  HorizontalTabView(tabs: [EventFeature.ticket, EventFeature.bagStorage, EventFeature.food, EventFeature.vip])
}
