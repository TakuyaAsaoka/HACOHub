//
//  CountdownView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/11.
//

import SwiftUI

struct CountdownView: View {
  let startTime: Int
  @State private var remainingTime: Int
  @State private var timer: Timer? = nil

  init(startTime: Int) {
    self.startTime = startTime
    _remainingTime = State(initialValue: startTime)
  }

  var body: some View {
    Text.sfProBold(timeString(from: remainingTime), size: 24)
    .onAppear {
      startTimer()
    }
    .onDisappear {
      timer?.invalidate()
    }
  }

  func startTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      if remainingTime > 0 {
        remainingTime -= 1
      } else {
        timer?.invalidate()
      }
    }
  }

  func timeString(from seconds: Int) -> String {
    let hours = seconds / 3600
    let minutes = (seconds % 3600) / 60
    let secs = seconds % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, secs)
  }
}

#Preview {
    CountdownView(startTime: 90)
}
