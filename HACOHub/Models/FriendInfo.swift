//
//  Friend.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import Foundation

struct FriendInfo {
		let name: String
		let address: String
		let zipCode: String
		let phoneNumber: String
}

enum Friend: CaseIterable {
		case lucaMoretti
		case aishaKhan
		case elenaRojas
		case omarAlSayed
		case sofiaPetrova
		case miaKhan
		case marcusMuller
		case jamalRobinson

		var friend: FriendInfo {
				switch self {
				case .lucaMoretti:
						return FriendInfo(name: "Luca Moretti",
													address: "245 Peachtree St NE, Atlanta, GA",
													zipCode: "30303",
													phoneNumber: "+1 (404) 555-0123")
				case .aishaKhan:
						return FriendInfo(name: "Aisha Khan",
													address: "210 Peachtree St NW, Atlanta, GA",
													zipCode: "30303",
													phoneNumber: "+1 (404) 555-0476")
				case .elenaRojas:
						return FriendInfo(name: "Elena Rojas",
													address: "500 S Grand Ave, Los Angeles, CA",
													zipCode: "90071",
													phoneNumber: "+1 (213) 555-0890")
				case .omarAlSayed:
						return FriendInfo(name: "Omar Al-Sayed",
													address: "1100 Olive Way, Seattle, WA",
													zipCode: "98101",
													phoneNumber: "+1 (206) 555-1348")
				case .sofiaPetrova:
						return FriendInfo(name: "Sofia Petrova",
													address: "87 Magnolia Dr, Forest, MS",
													zipCode: "39074",
													phoneNumber: "+1 (601) 555-0911")
				case .miaKhan:
						return FriendInfo(name: "Mia Khan",
													address: "2707 Cedar Springs Rd, Dallas, TX",
													zipCode: "75201",
													phoneNumber: "+1 (469) 555-0762")
				case .marcusMuller:
						return FriendInfo(name: "Marcus Müller",
													address: "1801 N Griffin St, Dallas, TX",
													zipCode: "75202",
													phoneNumber: "+1 (972) 555-0987")
				case .jamalRobinson:
						return FriendInfo(name: "Jamal Robinson",
													address: "801 Brickell Ave, Miami, FL",
													zipCode: "33131",
													phoneNumber: "+1 (305) 555-0459")
				}
		}

		static let allContacts: [Friend] = Friend.allCases

		// 名前で検索して Friend を返す
		static func friend(named name: String) -> FriendInfo? {
				return allContacts.first { $0.friend.name.lowercased() == name.lowercased() }?.friend
		}
}
