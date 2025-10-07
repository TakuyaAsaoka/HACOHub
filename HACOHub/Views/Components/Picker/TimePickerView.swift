//
//  TimePickerView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/07.
//

import SwiftUI

struct TimePickerView: View {
  let textSize: CGFloat

  @State private var selectedTime = Date()
  @State private var isShowingSheet = false

  var timeString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "a hh:mm"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter.string(from: selectedTime)
  }

  var body: some View {
    Button {
      isShowingSheet.toggle()
    } label: {
      HStack {
        Text.sfProRegular(timeString, size: textSize)
      }
    }
    .buttonStyle(.plain)
    .sheet(isPresented: $isShowingSheet) {
      VStack {
        DatePicker(
          "",
          selection: $selectedTime,
          displayedComponents: [.hourAndMinute]
        )
        .datePickerStyle(.wheel)
        .labelsHidden()
        .environment(\.locale, Locale(identifier: "en_US_POSIX"))
        .frame(height: 200)
        .padding(.top, 40)

        Divider()

        Button("OK") {
          isShowingSheet = false
        }
        .frame(maxWidth: .infinity)
        .padding()
      }
      .presentationDetents([.height(280)])
      .presentationDragIndicator(.visible)
    }
  }
}

#Preview {
    TimePickerView(textSize: 20)
}
