//
//  MyLockerView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI

struct MyLockerView: View {
  @State private var isScanModalView: Bool = false

  var body: some View {
    ZStack {
      getRGBColor(240, 240, 240)

      VStack(spacing: 16) {
        HomeHeaderView(title: "My Locker")
        ScrollView {
          ForEach(myLockers) { myLocker in
            MyLockerCard(
              isShowingQR: $isScanModalView,
              myLocker: myLocker
            )
          }
          .padding(.horizontal, 20)
          Spacer()
        }
      }

      if isScanModalView {
        ScanModalView()
          .onTapGesture {
            isScanModalView = false
          }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
    MyLockerView()
}
