//
//  Friend.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import Foundation

struct Friend: Identifiable {
  let id = UUID()
  let name: String
  let address: String
  let zipCode: String
  let phoneNumber: String
  let imageName: String
}

extension Friend {
  static let sampleData: [Friend] = [
    Friend(
      name: "Luca Moretti",
      address: "245 Peachtree St NE, Atlanta, GA",
      zipCode: "30303",
      phoneNumber: "+1 (404) 555-0123",
      imageName: "LucaMoretti"
    ),
    Friend(
      name: "Aisha Khan",
      address: "210 Peachtree St NW, Atlanta, GA",
      zipCode: "30303",
      phoneNumber: "+1 (404) 555-0476",
      imageName: "AishaKhan"
    ),
    Friend(
      name: "Elena Rojas",
      address: "500 S Grand Ave, Los Angeles, CA",
      zipCode: "90071",
      phoneNumber: "+1 (213) 555-0890",
      imageName: "ElenaRojas"
    ),
    Friend(
      name: "Omar Al-Sayed",
      address: "1100 Olive Way, Seattle, WA",
      zipCode: "98101",
      phoneNumber: "+1 (206) 555-1348",
      imageName: "OmarAISayed"
    ),
    Friend(
      name: "Sofia Petrova",
      address: "87 Magnolia Dr, Forest, MS",
      zipCode: "39074",
      phoneNumber: "+1 (601) 555-0911",
      imageName: "SofiaPetrova"
    ),
    Friend(
      name: "Mia Khan",
      address: "2707 Cedar Springs Rd, Dallas, TX",
      zipCode: "75201",
      phoneNumber: "+1 (469) 555-0762",
      imageName: "MiaKhan"
    ),
    Friend(
      name: "Marcus Müller",
      address: "1801 N Griffin St, Dallas, TX",
      zipCode: "75202",
      phoneNumber: "+1 (972) 555-0987",
      imageName: "MarcusMuller"
    ),
    Friend(
      name: "Jamal Robinson",
      address: "801 Brickell Ave, Miami, FL",
      zipCode: "33131",
      phoneNumber: "+1 (305) 555-0459",
      imageName: "JamalRobinson"
    )
  ]
}
