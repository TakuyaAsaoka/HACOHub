//
//  Event.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/05.
//

import SwiftUI

enum EventIcon: String {
  case ticket = "TicketIcon"
  case bagStorage = "BagStorageIcon"
  case food = "FoodIcon"
  case vip = "VIPIcon"
  case goods = "GoodsIcon"
}

enum EventFeature: String, Identifiable {
  var id: String { self.rawValue }

  case ticket = "Ticket"
  case bagStorage = "Bag Storage"
  case food = "Food"
  case vip = "VIP"
  case goods = "Goods"
}

struct EventInfo: Identifiable, Hashable {
  let id = UUID()
  let title: String
  let imageName: String
  let date: String
  let fullDate: String
  let time: String
  let place: String
  let features: [EventFeature]
  let availableLockers: Int
  let totalLockers: Int
}

let events: [EventInfo] = [
  EventInfo(title: "Autumn Sound Festival",
            imageName: "AutumnSoundFestival",
            date: "Oct 15",
            fullDate: "October 15, 2025",
            time: "10:00~17:00",
            place: "Sweet Auburn Music Fest",
            features: [EventFeature.ticket, EventFeature.bagStorage, EventFeature.food],
            availableLockers: 22,
            totalLockers: 24
           ),
  EventInfo(title: "Pumpkin Festival",
            imageName: "PumpkinFestival",
            date: "Oct 30",
            fullDate: "October 30, 2025",
            time: "17:00~22:00",
            place: "Centennial Olympic Park",
            features: [EventFeature.bagStorage, EventFeature.food],
            availableLockers: 8,
            totalLockers: 12
           ),
  EventInfo(title: "Atlanta NFL Season Game",
            imageName: "AtlantaNFLSeasonGame",
            date: "Nov 20",
            fullDate: "November 20, 2025",
            time: "13:00~15:00",
            place: "Mercedes-Benz Stadium",
            features: [EventFeature.ticket, EventFeature.bagStorage, EventFeature.vip, EventFeature.goods],
            availableLockers: 42,
            totalLockers: 60
           ),
  EventInfo(title: "Georgia Tech Yellow Jackets Game",
            imageName: "GerogiaTechYellowJacketsGame",
            date: "Nov 3",
            fullDate: "November 3, 2025",
            time: "15:00~17:00",
            place: "Bobby Dodd Stadium at Hyundai Field",
            features: [EventFeature.ticket, EventFeature.food],
            availableLockers: 3,
            totalLockers: 12
           ),
  EventInfo(title: "Global Artist Live Concert",
            imageName: "GlobalArtistLiveConcert",
            date: "Nov 15",
            fullDate: "November 15, 2025",
            time: "18:00~21:00",
            place: "State Farm Arena",
            features: [EventFeature.ticket, EventFeature.bagStorage],
            availableLockers: 18,
            totalLockers: 24
           ),
]
