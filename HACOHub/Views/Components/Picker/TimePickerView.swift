//
//  TimePickerView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/07.
//

import SwiftUI

struct TimePickerView: View {
  let textSize: CGFloat

  @State private var isShowingSheet = false
  @Binding var selectedTime: Date

  var body: some View {
    Button {
      isShowingSheet.toggle()
    } label: {
      HStack {
        Text.sfProRegular(fromDateToFormattedDate(date: selectedTime), size: textSize)
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
  @Previewable @State var selectedTime = Date()
  TimePickerView(textSize: 20, selectedTime: $selectedTime)
}
