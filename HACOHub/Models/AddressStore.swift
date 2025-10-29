//
//  AddressStore.swift
//  HACOHub
//
//  Created by user on 2025/10/29.
//

import SwiftUI
internal import Combine

class AddressStore: ObservableObject {
		@Published var address: String = "Current Location"
}
