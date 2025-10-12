//
//  HomeView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct HomeView: View {
  @State var situation: Situation? = nil

  struct SituationButton: Identifiable {
    let id = UUID()
    let text: String
    let imageName: String
    let color: Color
    let situation: Situation
  }

  let situationButtons: [SituationButton] = [
    SituationButton(
      text: "Delivery",
      imageName: "DeliveryIcon",
      color: getRGBColor(255, 248, 222),
      situation: .delivery,
    ),
    SituationButton(
      text: "Event",
      imageName: "EventIcon",
      color: getRGBColor(255, 235, 220),
      situation: .event,
    ),
    SituationButton(
      text: "Send",
      imageName: "SendIcon",
      color: getRGBColor(210, 247, 222),
      situation: .send,
    ),
    SituationButton(
      text: "Education",
      imageName: "EducationIcon",
      color: getRGBColor(205, 246, 250),
      situation: .education,
    ),
    SituationButton(
      text: "Lent",
      imageName: "LentIcon",
      color: getRGBColor(243, 231, 255),
      situation: .lent,
    ),
    SituationButton(
      text: "Medical",
      imageName: "MedicalIcon",
      color: getRGBColor(222, 237, 255),
      situation: .medical,
    )
  ]

  let bigCircleSize: CGFloat = 624
  let smallCircleRadius: CGFloat = 70
  var smallCircleSize: CGFloat {smallCircleRadius * 2}

  var body: some View {
    GeometryReader { geomerty in
      VStack(spacing: 0) {
        HomeHeaderView()

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
            
          ForEach(situationButtons.enumerated(), id: \.element.id) { index, button in
              let angle = Angle(degrees: Double(index) * (360.0 / Double(situationButtons.count)) - 90)

              Button{
                situation = button.situation
              } label: {
                ZStack{
                  Circle()
                    .foregroundColor(button.color)
                    .frame(width: smallCircleSize, height: smallCircleSize)

                  VStack(spacing:0){
                    Image(button.imageName)
                        .resizable()
                        .frame(width: 64, height: 64)
                    Text.sfProBold(button.text, size: 24)
                  }
                }
              }
              .buttonStyle(PlainButtonStyle())
              .offset(
                  x: CGFloat(cos(angle.radians)) * ellipseRadiusX,
                  y: CGFloat(sin(angle.radians)) * ellipseRadiusY
              )
              .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
          }
        }
      }
      .ignoresSafeArea()
      .frame(width: geomerty.size.width)
      .frame(maxHeight: .infinity)
      .navigationDestination(item: $situation) { situation in
        switch (situation) {
        case .event:
          EventView()
        default:
          EmptyView()
        }
      }
    }
  }
}

#Preview {
  HomeView()
}
