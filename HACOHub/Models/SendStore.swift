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
	@Published var friend: FriendInfo = Friend.lucaMoretti.friend
}

class ReceiveStore: ObservableObject {
	@Published var location: String? = "7th St NE, Atlanta, GA 30308"
  @Published var latitude: CLLocationDegrees = 33.7518510
  @Published var longitude: CLLocationDegrees = -84.3853718
	@Published var size: String = "Small"
	@Published var cost: Int = 5
	@Published var isExpress: Bool = false
	@Published var expressFee: Int = 3
	@Published var friend: FriendInfo = Friend.lucaMoretti.friend
}
