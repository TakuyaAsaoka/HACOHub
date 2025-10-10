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
    
  let count = 6
  let bigDiameter: CGFloat = 600
  let smalDiameter: CGFloat = 140

  var body: some View {
    VStack {
        //上段HACOHub・アラームマーク spacerで間隔出し
        HStack {
            Text.sfProBold("HACOHub", size: 32)
                .foregroundColor(getRGBColor(79, 190, 159))
            Spacer()
            Button {
                // TODO: 通知一覧を表示する
                print()
            } label: {
                ZStack {
                    Image("AlarmIcon")
                }
            }
            
        }
        .padding(.horizontal, 20)
        //中段サークル
            ZStack{
                //大きな円
                Circle()
                    .foregroundColor(getRGBColor(236, 249, 243))
                    .frame(width: bigDiameter, height: bigDiameter)
                //小さな円
                //ForEach(0..<count, id: \.self) { i in
                    //let angle = Angle.degrees(Double(i) / Double(count) * 360)
                    //let radius = (bigDiameter - smalDiameter) / 2
                    
                    
                    
                //}
                
        }
    }
  }
}

#Preview {
    HomeView()
}
