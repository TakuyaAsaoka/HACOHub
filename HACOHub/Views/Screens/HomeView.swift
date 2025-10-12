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

  let bigCirclesize: CGFloat = 624
  let smallCircleRadius: CGFloat = 70
  var smallCirclesize: CGFloat {smallCircleRadius * 2}

  var body: some View {
    GeometryReader { geomerty in
      VStack(spacing: 20) {
        HomeHeaderView()
          
        //小さい円情報
        let Buttons:[(String, String, Color)] = [
          ("Delivery", "DeliveryIcon", getRGBColor(255, 248, 222)),
          ("Event", "EventIcon", getRGBColor(255, 235, 220)),
          ("Send", "SendIcon", getRGBColor(210, 247, 222)),
          ("Education", "EducationIcon", getRGBColor(205, 246, 250)),
          ("Lent", "LentIcon", getRGBColor(243, 231, 255)),
          ("Medical", "MedicalIcon", getRGBColor(222, 237, 255))
          //("Books", "BooksIcon", getRGBColor(255, 235, 235)),
         
        ]
          
        //配置する円の半径(小さい円の中心が置かれる線路円の半径)
        let middleRadius = ((bigCirclesize / 2) - (smallCirclesize / 2)) - 10
          let ellipseRadiusX = (bigCirclesize / 2) - (smallCirclesize / 2) * 2.2 // 横方向の短い半径
          let ellipseRadiusY = (bigCirclesize / 2) - (smallCirclesize / 2) * 1.2 // 縦方向の長い半径
          
        //中段サークル
        ZStack{
          //大きな円
          Circle()
            .foregroundColor(getRGBColor(236, 249, 243))
            .frame(width: bigCirclesize, height: bigCirclesize)
          //中央アイコン
          Image("TrackIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 179, height: 179)
                .offset(y: -bigCirclesize / 2 + bigCirclesize / 2)
            
          
          
          //小さい円を７つ放射状に配置
            ForEach(0..<Buttons.count, id: \.self) { i in
                let angle = Angle(degrees: Double(i) * (360.0 / Double(Buttons.count)) - 90)
                
                let label = Buttons[i].0
                let icon = Buttons[i].1
                let color = Buttons[i].2
                
                Button{
                } label: {
                    ZStack{
                        Circle()
                            .foregroundColor(color)
                            .frame(width: smallCirclesize, height: smallCirclesize)
                        
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
//                    x: CGFloat(cos(angle.radians - .pi / 2)) * middleRadius,
//                    y: CGFloat(sin(angle.radians - .pi / 2)) * middleRadius
                    x: CGFloat(cos(angle.radians)) * ellipseRadiusX,
                    y: CGFloat(sin(angle.radians)) * ellipseRadiusY
                )
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
            }
        }
//        .border(.red)
      }
      .ignoresSafeArea()
//      .border(.blue)
      .frame(width: geomerty.size.width, height: .infinity)
    }
  }
}

#Preview {
  HomeView()
}
