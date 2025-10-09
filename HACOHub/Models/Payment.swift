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
}

let paymentButtons: [RadioButton] = [
  RadioButton(imageName: Payment.applePay.rawValue, imageWidth: 52),
  RadioButton(imageName: Payment.creditCard.rawValue, imageWidth: 36),
  RadioButton(imageName: Payment.payPal.rawValue, imageWidth: 83),
]
