//
//  ScanModalView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/11.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ScanModalView: View {
  @State private var isShowingQRView = false

  var body: some View {
    DimmedOverlayModalView(vPadding: isShowingQRView ? 32 : 16) {
      ZStack {
        if !isShowingQRView {
          VStack(spacing: 12) {
            Text.sfProBold("Your QR Code", size: 24)
            Divider()
              .background(getRGBColor(110, 119, 129))
              .padding(.horizontal, 20)
            QRCodeView()
            HStack(spacing: 8) {
              CountdownView(startTime: 90)
              Button {

              } label: {
                Image("RegenerateIcon")
              }
            }

            Divider()
              .background(getRGBColor(110, 119, 129))
              .padding(.horizontal, 20)

            VStack(alignment: .leading) {
              HStack(spacing: 0) {
                Text.sfProBold("Location:", size: 14)
                Text.sfProRegular("Sunset Sound Festiva", size: 14)
              }
              Text.sfProRegular("HACOHub Music Plaza Entrance Locker 02", size: 14)
                .padding(.bottom, 14)
              Text.sfProRegular("Increase screen brightness for easier scanning.", size: 14)
              Text.sfProRegular("Contact: +1-555-2368", size: 14)
                .padding(.bottom, 2)

              GrayRoundedButton(
                text: "Back",
                weight: .regular,
                size: 16,
                vPadding: 10,
                radius: 11,
                action: {}
              )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
          }
          .onTapGesture {
            withAnimation(.easeInOut(duration: 0.4)) {
              isShowingQRView = true
            }
          }
          .transition(.opacity.combined(with: .scale))
          .transition(.opacity)
        }

        if isShowingQRView {
          VStack(spacing: 0) {
            Image("CompletedIcon")
              .resizable()
              .scaledToFit()
              .frame(width: 115.5, height: 115.5)
              .padding(.bottom, 5)
            Text.sfProBold("Scan Complete！", size: 24)
              .padding(.bottom, 8)
            Text.sfProRegular(
              "Please proceed to the locker.",
              size: 20
            )
            .multilineTextAlignment(.center)
          }
          .transition(.opacity)
        }
      }
    }
  }
}

struct QRCodeView: View {
  let text: String = "1234567890-abcdef"

  var body: some View {
    ZStack {
      Image(uiImage: generateQRCode(with: text) ?? UIImage(named: "RegenerateIcon")!)
        .interpolation(.none)
        .resizable()
        .scaledToFit()
        .frame(width: 200, height: 200)

      Image(systemName: "star.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 40, height: 40)
        .foregroundColor(getRGBColor(79, 190, 159))
        .background(.white.opacity(0.8))
        .clipShape(Circle())
    }
  }


  func generateQRCode(with inputText: String) -> UIImage? {
    guard let qrFilter = CIFilter(name: "CIQRCodeGenerator")
    else { return nil }

    let inputData = inputText.data(using: .utf8)
    qrFilter.setValue(inputData, forKey: "inputMessage")
    qrFilter.setValue("H", forKey: "inputCorrectionLevel")

    guard let ciImage = qrFilter.outputImage
    else { return nil }

    let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
    let scaledCiImage = ciImage.transformed(by: sizeTransform)

    let context = CIContext()
    guard let cgImage = context.createCGImage(
      scaledCiImage,
      from: scaledCiImage.extent
    )
    else { return nil }

    return UIImage(cgImage: cgImage)
  }
}

#Preview {
    ScanModalView()
}
