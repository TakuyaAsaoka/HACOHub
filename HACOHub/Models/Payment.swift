//
//  Payment.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/07.
//

import SwiftUI

enum Payment: String {
  case applePay = "ApplePayIcon"
  case creditCard = "CreditCardIcon"
  case payPal = "PayPalIcon"

  static func fromImageName(_ name: String) -> Payment? {
    let lower = name.lowercased()
    if lower.contains("applepay") { return .applePay }
    if lower.contains("creditcard") { return .creditCard }
    if lower.contains("paypal") { return .payPal }
    return nil
  }

  var imageWidth: CGFloat {
    switch self {
    case .applePay: return 52
    case .creditCard: return 36
    case .payPal: return 83
    }
  }

  var whiteImageName: String {
    switch self {
    case .applePay: return "WhiteApplePayIcon"
    case .creditCard: return "WhiteCreditCardIcon"
    case .payPal: return "WhitePayPalIcon"
    }
  }
}

let paymentButtons: [RadioButton] = [
  RadioButton(imageName: Payment.applePay.rawValue, imageWidth: Payment.applePay.imageWidth),
  RadioButton(imageName: Payment.creditCard.rawValue, imageWidth: Payment.creditCard.imageWidth),
  RadioButton(imageName: Payment.payPal.rawValue, imageWidth: Payment.payPal.imageWidth),
]
