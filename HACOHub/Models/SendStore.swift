//
//  AddressStore.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI
internal import Combine

class SendStore: ObservableObject {
	@Published var address: String = "Current Location"
	@Published var friend: String = ""
	@Published var friendAddress: String = ""
	@Published var phone: String = ""
}
