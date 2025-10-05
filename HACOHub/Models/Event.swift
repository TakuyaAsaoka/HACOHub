//
//  Event.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/05.
//

import SwiftUI

struct EventInfo: Identifiable {
  let id = UUID()
  let title: String
  let imageName: String
  let date: String
  let time: String
  let availableLockers: Int
  let totalLockers: Int
}

let events: [EventInfo] = [
  EventInfo(title: "Autumn Sound Festival", imageName: "AutumnSoundFestival", date: "10/15", time: "10:00~17:00", availableLockers: 22, totalLockers: 24),
  EventInfo(title: "Pumpkin Festival", imageName: "PumpkinFestival", date: "10/30", time: "17:00~22:00", availableLockers: 8, totalLockers: 12),
  EventInfo(title: "Atlanta NFL Season Game", imageName: "AtlantaNFLSeasonGame", date: "11/20", time: "13:00~15:00", availableLockers: 42, totalLockers: 60),
  EventInfo(title: "Georgia Tech Yellow Jackets Home Game", imageName: "GerogiaTechYellowJacketsHomeGame", date: "11/3", time: "15:00~17:00", availableLockers: 3, totalLockers: 12),
  EventInfo(title: "Global Artist Live Concert", imageName: "GlobalArtistLiveConcert", date: "11/15", time: "18:00~21:00", availableLockers: 18, totalLockers: 24),
]
