//
//  PrimaryRadioButtonGrid.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/07.
//

import SwiftUI

struct RadioButton: Identifiable {
  let id = UUID()
  let text: String?
  let imageName: String?
  let imageWidth: CGFloat?

  init(text: String? = nil, imageName: String? = nil, imageWidth: CGFloat? = nil) {
    self.text = text
    self.imageName = imageName
    self.imageWidth = imageWidth
  }
}

struct PrimaryRadioButtonGrid: View {
  @Binding var selectedItem: UUID?

  let buttons: [RadioButton]
  let alignment: HorizontalAlignment
  let columns: Int
  let height: CGFloat
  let width: CGFloat
  let vSpacing: CGFloat
  let hSpacing: CGFloat

  var body: some View {
    let gridItems = Array(repeating: GridItem(.fixed(width), spacing: hSpacing), count: columns)

    LazyVGrid(columns: gridItems, alignment: alignment, spacing: vSpacing) {
      ForEach(buttons) { button in
        Button {
          selectedItem = button.id
        } label: {
          ZStack {
            RoundedRectangle(cornerRadius: 8)
              .stroke(selectedItem == button.id ? getRGBColor(79, 190, 159) : getRGBColor(208, 215, 222), lineWidth: 1)

            if let text = button.text {
              Text.sfProBold(text, size: 16)
                .multilineTextAlignment(.center)
            } else if let imageName = button.imageName {
              Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: button.imageWidth)
            }
          }
          .frame(height: height)
          .background(
            RoundedRectangle(cornerRadius: 8)
              .fill(selectedItem == button.id ? getRGBColor(236, 249, 243) : .white)
              .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 2)
          )
        }
        .buttonStyle(.plain)
      }
    }
    .onAppear {
      if selectedItem == nil, let first = buttons.first {
        selectedItem = first.id
      }
    }
  }
}

#Preview {
  @Previewable @State var selectedItem: UUID? = nil

  PrimaryRadioButtonGrid(
    selectedItem: $selectedItem,
    buttons: [
      RadioButton(text: "button1"),
      RadioButton(text: "button2"),
      RadioButton(text: "button3"),
      RadioButton(imageName: Payment.applePay.rawValue, imageWidth: 30),
      RadioButton(imageName: Payment.creditCard.rawValue, imageWidth: 40),
      RadioButton(imageName: Payment.payPal.rawValue, imageWidth: 60),
      RadioButton(text: "button1"),
      RadioButton(text: "button2"),
    ],
    alignment: .trailing,
    columns: 3,
    height: 40,
    width: 100,
    vSpacing: 20,
    hSpacing: 4
  )
}
