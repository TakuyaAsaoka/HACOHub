//
//  TitleHeaderView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/10.
//

import SwiftUI

struct TitleHeaderView: View {
  let title: String

  var body: some View {
    VStack {
      Spacer()
      HStack {
        Text.sfProBold(title, size: 20)
        Spacer()
      }
      .padding(.bottom, 15)
    }
    .padding(.leading, 20)
    .frame(height: 103)
    .background(Color.white)
  }
}

#Preview {
    ZStack {
      Color.gray
      VStack {
        TitleHeaderView(title: "My Locker")
        Spacer()
    }
  }
  .ignoresSafeArea()
}
