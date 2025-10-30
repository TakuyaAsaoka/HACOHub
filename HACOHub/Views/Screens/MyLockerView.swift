//
//  MyLockerView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI

struct MyLockerView: View {
  @State private var isScanModalView: Bool = false
	@Binding var path: NavigationPath

  var body: some View {
    ZStack {
      getRGBColor(240, 240, 240)

      VStack(spacing: 0) {
        ScrollView {
          ForEach(myLockers) { myLocker in
            MyLockerCard(
              isShowingQR: $isScanModalView,
              myLocker: myLocker
            )
          }
          .padding(.top, 16)
          .padding(.horizontal, 20)
          Spacer()
        }
      }

      if isScanModalView {
        ScanModalView(isPresented: $isScanModalView)
          .onTapGesture {
            isScanModalView = false
          }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
	MyLockerView(path: .constant(NavigationPath()))
}
