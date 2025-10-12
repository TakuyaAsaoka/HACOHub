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

  let bigCircleSize: CGFloat = 624
  let smallCircleRadius: CGFloat = 70
  var smallCircleSize: CGFloat {smallCircleRadius * 2}

  var body: some View {
    GeometryReader { geomerty in
      VStack(spacing: 0) {
        HomeHeaderView()
        let Buttons:[(String, String, Color)] = [
          ("Delivery", "DeliveryIcon", getRGBColor(255, 248, 222)),
          ("Event", "EventIcon", getRGBColor(255, 235, 220)),
          ("Send", "SendIcon", getRGBColor(210, 247, 222)),
          ("Education", "EducationIcon", getRGBColor(205, 246, 250)),
          ("Lent", "LentIcon", getRGBColor(243, 231, 255)),
          ("Medical", "MedicalIcon", getRGBColor(222, 237, 255))
        ]
          
        let ellipseRadiusX = (bigCircleSize / 2) - (smallCircleSize / 2) * 2.2
        let ellipseRadiusY = (bigCircleSize / 2) - (smallCircleSize / 2) * 1.2
          
        ZStack{
          Circle()
            .foregroundColor(getRGBColor(236, 249, 243))
            .frame(width: bigCircleSize, height: bigCircleSize)

          Image("TrackIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 179, height: 179)
                .offset(y: -bigCircleSize / 2 + bigCircleSize / 2)
            
          ForEach(0..<Buttons.count, id: \.self) { i in
              let angle = Angle(degrees: Double(i) * (360.0 / Double(Buttons.count)) - 90)
              let label = Buttons[i].0
              let icon = Buttons[i].1
              let color = Buttons[i].2

              Button{
                // TODO: action()
              } label: {
                ZStack{
                  Circle()
                      .foregroundColor(color)
                      .frame(width: smallCircleSize, height: smallCircleSize)

                  VStack(spacing:0){
                    Image(icon)
                        .resizable()
                        .frame(width: 64, height: 64)
                    Text(label)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center).font(.caption)
                  }
                }
              }
              .offset(
                  x: CGFloat(cos(angle.radians)) * ellipseRadiusX,
                  y: CGFloat(sin(angle.radians)) * ellipseRadiusY
              )
              .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
          }
        }
      }
      .ignoresSafeArea()
      .frame(width: geomerty.size.width, height: .infinity)
    }
  }
}

#Preview {
  HomeView()
}
