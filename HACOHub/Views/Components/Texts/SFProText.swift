//
//  SFProText.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct BaseCustomText: View {
  let text: String
  let size: CGFloat
  let font: FontNames

  var body: some View {
    Text(text)
      .font(.custom(font.rawValue, size: size))
  }
}

struct NotoRegularText: View {
  let text: String
  let size: CGFloat

  var body: some View {
    BaseCustomText(text: text, size: size, font: FontNames.notoSansJpRegular)
  }
}

struct NotoBoldText: View {
  let text: String
  let size: CGFloat

  var body: some View {
    BaseCustomText(text: text, size: size, font: FontNames.notoSansJpBold)
  }
}

struct SFProRegularText: View {
  let text: String
  let size: CGFloat

  var body: some View {
    Text(text)
      .font(.system(size: size, weight: .regular))
  }
}

struct SFProBoldText: View {
  let text: String
  let size: CGFloat

  var body: some View {
    Text(text)
      .font(.system(size: size, weight: .bold))
  }
}

#Preview {
  NotoRegularText(text: "HacoText", size: 48)
  NotoBoldText(text: "HacoText", size: 48)
}
