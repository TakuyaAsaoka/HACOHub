//
//  AddressStore.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI
import MapKit
internal import Combine

class SendStore: ObservableObject {
	@Published var location: String? = "Current Location"
  @Published var latitude: CLLocationDegrees = 33.7518510
  @Published var longitude: CLLocationDegrees = -84.3853718
	@Published var size: String = "Small"
	@Published var cost: Int = 5
	@Published var isExpress: Bool = false
	@Published var expressFee: Int = 3
  @Published var selectedFriend: Friend? = Friend.sampleData[0]

  func reset() {
    location = "Current Location"
    latitude = 33.7518510
    longitude = -84.3853718
    size = "Small"
    cost = 5
    isExpress = false
    expressFee = 3
    selectedFriend = Friend.sampleData[0]
  }
}

class ReceiveStore: ObservableObject {
	@Published var location: String? = "7th St NE, Atlanta, GA 30308"
  @Published var latitude: CLLocationDegrees = 33.7518510
  @Published var longitude: CLLocationDegrees = -84.3853718
  @Published var date: Date = Date()
	@Published var size: String = "Small"
  @Published var payment: Payment = .applePay
	@Published var cost: Int = 5
	@Published var isExpress: Bool = false
	@Published var expressFee: Int = 3
  @Published var friend: Friend = Friend.sampleData[0]
}
