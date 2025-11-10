//
//  DatePickerView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/11/10.
//

import SwiftUI

struct DatePickerView: View {
  let textSize: CGFloat

  @State private var isShowingSheet = false
  @Binding var selectedDate: Date

  var body: some View {
    Button {
      isShowingSheet.toggle()
    } label: {
      HStack {
        Text.sfProRegular(fromDateToFormattedDate(date: selectedDate, format: "MMMM d, yyyy"), size: textSize)
      }
    }
    .buttonStyle(.plain)
    .sheet(isPresented: $isShowingSheet) {
      VStack {
        DatePicker(
          "",
          selection: Binding(
            get: { selectedDate },
            set: { newValue in
              selectedDate = mergeDateAndTime(
                datePart: newValue,
                timePart: selectedDate
              )
            }
          ),
          displayedComponents: [.date]
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
  @Previewable @State var selectedDate = Date()
  DatePickerView(textSize: 20, selectedDate: $selectedDate)
}
