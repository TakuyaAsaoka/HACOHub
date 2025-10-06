//
//  HomeView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct HomeView: View {
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

  var body: some View {
    ZStack(alignment: .top) {
        Text.sfProBold("HACOHub", size: 64)
          .foregroundColor(.black)
    }
  }
}

#Preview {
    HomeView()
}
