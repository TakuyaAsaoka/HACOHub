//
//  HomeHeader.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/11.
//

import SwiftUI

struct HomeHeaderView: View {
  var body: some View {
    VStack {
      Spacer()
      HStack(alignment: .bottom) {
        Text.sfProBold("HACOHub", size: 32)
          .foregroundColor(getRGBColor(79, 190, 159))
        Spacer()
        Button {

        } label: {
          Image("AlartIcon")
        }
      }
      .padding(.horizontal, 20)
    }
    .padding(.bottom, 8)
    .frame(height: 103)
    .background(.white)
  }
}

#Preview {
  ZStack {
    Color.gray
    VStack {
      HomeHeaderView()
      Spacer()
    }
  }
  .ignoresSafeArea()
}
