//
//  HelperFunction.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

func getRGBColor(_ r: Int, _ g: Int, _ b: Int, _ a: Double = 1) -> Color {
  Color(.sRGB,
    red: Double(r) / 255.0,
    green: Double(g) / 255.0,
    blue: Double(b) / 255.0,
    opacity: a
  )
}

func getColumns(n: Int, spacing: CGFloat) -> [GridItem] {
  guard n > 0 else { return [] }

  return (0..<n).map { index in
    GridItem(
      .flexible(),
      spacing: index == n - 1 ? 0 : spacing
    )
  }
}

func fromDateToFormattedDate(date: Date, format: String = "a hh:mm") -> String {
  let formatter = DateFormatter()
  formatter.dateFormat = format
  formatter.locale = Locale(identifier: "en_US_POSIX")
  return formatter.string(from: date)
}

func fromDateToFullDate(date: Date, format: String = "MMMM dd, yyyy a hh:mm") -> String {
  let formatter = DateFormatter()
  formatter.dateFormat = format
  formatter.locale = Locale(identifier: "en_US_POSIX")
  return formatter.string(from: date)
}

func mergeDateAndTime(datePart: Date, timePart: Date) -> Date {
  let calendar = Calendar.current
  let dateComponents = calendar.dateComponents([.year, .month, .day], from: datePart)
  let timeComponents = calendar.dateComponents([.hour, .minute, .second], from: timePart)

  var merged = DateComponents()
  merged.year = dateComponents.year
  merged.month = dateComponents.month
  merged.day = dateComponents.day
  merged.hour = timeComponents.hour
  merged.minute = timeComponents.minute
  merged.second = timeComponents.second

  return calendar.date(from: merged) ?? datePart
}

func formatDateWithAMPM(_ date: Date) -> String {
  let formatter = DateFormatter()
  formatter.locale = Locale(identifier: "en_US_POSIX")
  formatter.dateFormat = "MMMM d, yyyy, a h:mm"
  return formatter.string(from: date)
}
