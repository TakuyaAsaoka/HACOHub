//
//  HomeView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct HomeView: View {
  @State private var situation: Situation? = nil
  @State private var showMapView: Bool = false

  struct SituationButton: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let situation: Situation
  }

  let situationButtons: [SituationButton] = [
    SituationButton(text: "Delivery", situation: .delivery),
    SituationButton(text: "Event", situation: .event),
    SituationButton(text: "Send", situation: .send),
    SituationButton(text: "Education", situation: .education),
    SituationButton(text: "Lent", situation: .lent),
    SituationButton(text: "Medical", situation: .medical)
  ]

  let columns = getColumns(n: 2, spacing: 12)

  var body: some View {
    ZStack(alignment: .top) {
      VStack(spacing: 40) {
        Text.sfProBold("HACOHub", size: 64)
          .foregroundColor(.white)
          .padding(.top, 120)
        }
        .background(Color.white.opacity(0.56))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 32, x: 0, y: 0)
      }
  }
}

#Preview {
    HomeView()
}
