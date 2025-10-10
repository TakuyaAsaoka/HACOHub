//
//  MyLocker.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/10.
//

import SwiftUI

struct MyLocker: Identifiable {
  let id = UUID()
  var status: LockerStatus
  var size: LockerSize
  var locatin: String
  var time: Date
  var dailyRate: Double
}

enum LockerStatus: String {
  case reserved = "Reserved"
  case inUse = "In Use"
  case completed = "Completed"
}

let myLockers: [MyLocker] = [
  MyLocker(
    status: .reserved,
    size: .small,
    locatin: "Sweet Auburn Music Fest Entrance",
    time: Date(),
    dailyRate: 4
  ),
  MyLocker(
    status: .inUse,
    size: .medium,
    locatin: "Sweet Auburn Music Fest Entrance",
    time: Date(),
    dailyRate: 8
  ),
  MyLocker(
    status: .completed,
    size: .large,
    locatin: "Sweet Auburn Music Fest Entrance",
    time: Date(),
    dailyRate: 12
  )
]
