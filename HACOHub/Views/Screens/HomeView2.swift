//
//  HomeView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/02.
//

import SwiftUI

struct HomeView2: View {
  @State var situation: Situation? = nil

  struct SituationButton: Identifiable {
    let id = UUID()
    let text: String
    let subtitle1: String?
    let subtitle2: String?
    let imageName: String
    let color: Color
    let situation: Situation
    let imageSize: CGSize
    let padding: CGFloat
      
  }

  let situationButtons: [SituationButton] = [
    SituationButton(
      text: "Send",
      subtitle1: "Ship items to",
      subtitle2: "anyone",
      imageName: "SendIcon",
      color: getRGBColor(255, 255, 255, 1),
      situation: .send,
      imageSize: CGSize(width: 79, height: 69),
      padding: 26
    ),
    SituationButton(
      text: "Receive",
      subtitle1: "Collect your",
      subtitle2: "items",
      imageName: "PickUpIcon",
      color: getRGBColor(255, 255, 255, 1),
      situation: .pickup,
      imageSize: CGSize(width: 83, height: 83),
      padding: 26
    ),
    SituationButton(
      text: "Share",
      subtitle1: "Ship items to",
      subtitle2: "anyone",
      imageName: "ShareIcon",
      color: getRGBColor(255, 255, 255, 1),
      situation: .share,
      imageSize: CGSize(width: 83, height: 83),
      padding: 13
      
    ),
    SituationButton(
      text: "Store",
      subtitle1: "Store items",
      subtitle2: "in zone",
      imageName: "StoreIcon",
      color: getRGBColor(255, 255, 255, 1),
      situation: .dropoff,
      imageSize: CGSize(width: 55, height: 100),
      padding: 16
    )
    
  ]
    
  struct PopularUseCaseButton: Identifiable {
      let id = UUID()
      let text: String
      let subtitle1: String?
      let subtitle2: String?
      let imageName: String
      let color: Color
      let situation: Situation
      let padding: CGFloat
  }

    let PopularUseCaseButtons: [PopularUseCaseButton] = [
       PopularUseCaseButton(
        text: "AirPort to Hotel",
        subtitle1: "Send luggage directly",
        subtitle2: "to your hotel",
        imageName: "AirPortIcon",
        color: getRGBColor(245, 251, 254),
        situation: .airport,
        padding: 44
      ),
       PopularUseCaseButton(
        text: "Event Locer",
        subtitle1: "Store items during events",
        subtitle2: "& concerts",
        imageName: "EventLockerIcon",
        color: getRGBColor(252, 245, 250),
        situation: .event,
        padding: 44
      ),
       PopularUseCaseButton(
        text: "Sendto Friend",
        subtitle1: "share items via",
        subtitle2: "secure locker",
        imageName: "SendToFriendIcon",
        color: getRGBColor(245, 252, 250),
        situation: .sendtofriend,
        padding: 44
      )
    ]
    
    struct NearbyHacohubLocationButon: Identifiable {
        let id = UUID()
        let text: String
        let subtitle1: String?
        let imageName: String
        let availables: String?

        let color: Color
        let situation: Situation
        let padding: CGFloat
    }

      let NearbyHacohubLocationButons: [NearbyHacohubLocationButon] = [
        NearbyHacohubLocationButon(
          text: "Shibuya Station",
          subtitle1: "0.3 km away",
          imageName: "NearByIcon",
          availables: "5 available",
          color: getRGBColor(255, 255, 255, 1),
          situation: .shibuya,
          padding: 24
        ),
        NearbyHacohubLocationButon(
          text: "Omotesando Hills",
          subtitle1: "0.8 km away",
          imageName: "NearByIcon",
          availables: "5 available",
          color: getRGBColor(255, 255, 255, 1),
          situation: .OmotesandoHills,
          padding: 24
        ),
        NearbyHacohubLocationButon(
          text: "Harajuku Center",
          subtitle1: "1.2 km away",
          imageName: "NearByIcon",
          availables: "5 available",
          color: getRGBColor(255, 255, 255, 1),
          situation: .HarajukuCenter,
          padding: 24
        )
      ]
    
  let frameWidth: CGFloat = 345
  let frameHeight: CGFloat = 364
  let smallWidth: CGFloat = 162
  let smallHeight: CGFloat = 176

  var body: some View {
    GeometryReader { geomerty in
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
        
              Spacer()
                  .frame(height: 19.46)
              
              Text("What would you like to do?")
                  .font(.custom("Inter", size: 16))
                  .fontWeight(.regular)
                  .lineSpacing(24 - 16)
                  .tracking(-0.31)
                  .frame(width: 345, alignment: .leading)
                  .foregroundColor(getRGBColor(54, 65, 83, 1))
              Spacer()
                  .frame(height: 16.53)
              
              ZStack{
                  let positions:[(x: CGFloat, y: CGFloat)] =  [
                    (x: 0 + smallWidth/2, y: 0 + smallHeight/2),
                    (x: frameWidth - smallWidth/2, y: 0 + smallHeight/2),
                    (x: frameWidth - smallWidth/2, y: frameHeight - smallHeight/2), 
                    (x: 0 + smallWidth/2, y: frameHeight - smallHeight/2)
                  ]
                  ForEach(Array(situationButtons.enumerated()), id: \.element.id) { index, button in
                      let pos = positions[index % positions.count]
                      Button{
                          situation = button.situation
                      } label: {
                          ZStack{
                              RoundedRectangle(cornerRadius:16)
                                  .foregroundColor(button.color)
                                  .frame(width: smallWidth, height: smallHeight)
                                  .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                              
                              VStack(spacing:4){
                                  VStack(alignment: .leading, spacing: 2){
                                      Text(button.text)
                                          .font(.custom("Inter", size: 18))
                                          .fontWeight(.regular)
                                          .lineSpacing(28 - 18)
                                          .tracking(-0.44)
                                          .foregroundColor(getRGBColor(36, 41, 47, 1))
                                      
                                      if let subtitle1 = button.subtitle1 {
                                          Text(subtitle1)
                                              .font(.custom("Inter", size: 14))
                                              .fontWeight(.regular)
                                              .lineSpacing(20 - 14)
                                              .tracking(-0.15)
                                              .foregroundColor(getRGBColor(106, 114, 130, 1))
                                      }
                                      
                                      if let subtitle2 = button.subtitle2 {
                                          Text(subtitle2)
                                              .font(.custom("Inter", size: 14))
                                              .fontWeight(.regular)
                                              .lineSpacing(20 - 14)
                                              .tracking(-0.15)
                                              .foregroundColor(getRGBColor(106, 114, 130, 1))
                                      }
                                  }
                                  .frame(maxWidth: .infinity, alignment: .leading)
                                  .frame(maxHeight: .infinity, alignment: .top)
                                  .padding(.leading, 24)
                                  .padding(.top, 12)
                                  
                                  Image(button.imageName)
                                      .resizable()
                                      .frame(width: button.imageSize.width, height: button.imageSize.height)
                                      .padding(.bottom, button.padding)
                              }
                              .frame(width: smallWidth, height: smallHeight)
                          }
                      }
                      .buttonStyle(PlainButtonStyle())
                      .position(x: pos.x, y: pos.y)
                  }
              }
              .frame(width: frameWidth, height: frameHeight)
              
              Spacer()
                  .frame(height: 16)
              HStack{
                  Text("Popular Use Case")
                      .font(.custom("Inter", size: 16))
                      .fontWeight(.regular)
                      .lineSpacing(24 - 16)
                      .tracking(-0.31)
                      .foregroundColor(getRGBColor(54, 65, 83, 1))
                  
                  Spacer()
                  
                  HStack(spacing: 0){
                      Text("View More")
                          .font(.custom("Inter", size: 14))
                          .fontWeight(.regular)
                          .lineSpacing(20 - 14)
                          .tracking(-0.15)
                          .foregroundColor(getRGBColor(79, 190, 159, 1))
                      Image("RightArrow")
                  }
              }
              .frame(width: 345)
              
              Spacer()
                  .frame(height: 16)
              
              VStack(spacing:12){
                  ForEach(PopularUseCaseButtons) { button in
                      Button{
                          situation = button.situation
                      } label: {
                          ZStack{
                              RoundedRectangle(cornerRadius:16)
                                  .foregroundColor(button.color)
                                  .frame(width: 345, height: 96)
                                  .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                              
                              HStack{
                                  Image(button.imageName)
                                  
                                  Spacer()
                                      .frame(width: 16)
                                  
                                  VStack(alignment: .leading, spacing: 0) {
                                      Text(button.text)
                                          .font(.custom("Inter", size: 18))
                                          .foregroundColor(getRGBColor(36, 41, 47, 1))
                                      if let subtitle1 = button.subtitle1{
                                          Text(subtitle1)
                                              .font(.custom("Inter", size: 14))
                                              .fontWeight(.regular)
                                              .foregroundColor(getRGBColor(102, 118, 134, 1))
                                      }
                                      if let subtitle2 = button.subtitle2{
                                          Text(subtitle2)
                                              .font(.custom("Inter", size: 14))
                                              .fontWeight(.regular)
                                              .foregroundColor(getRGBColor(102, 118, 134, 1))
                                      }
                                  }
                                  Spacer()
                                  Image("GrayRightArrow")
                              }
                              .padding(.horizontal,button.padding)
                          }
                      }
                      .buttonStyle(.plain)
                  }
              }
              
              Spacer()
                  .frame(height: 16)
              HStack{
                  Text("Nearby HACOHub Locations")
                      .font(.custom("Inter", size: 16))
                      .fontWeight(.regular)
                      .lineSpacing(24 - 16)
                      .tracking(-0.31)
                  //.frame(width: 345, alignment: .leading)
                      .foregroundColor(getRGBColor(54, 65, 83, 1))
                  
                  Spacer()
                  
                  HStack(spacing: 0){
                      Text("Map")
                          .font(.custom("Inter", size: 14))
                          .fontWeight(.regular)
                          .lineSpacing(20 - 14)
                          .tracking(-0.15)
                          .foregroundColor(getRGBColor(79, 190, 159, 1))
                      Image("RightArrow")
                  }
                
              }
              .frame(width: 345)
              
              Spacer()
                  .frame(height: 11.99)
                
              VStack(spacing:12){
                    ForEach(NearbyHacohubLocationButons) { button in
                        Button{
                            situation = button.situation
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius:16)
                                    .foregroundColor(button.color)
                                    .frame(width: 345, height: 56)
                                    .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                                
                                HStack{
                                    Image(button.imageName)
                                    
                                    Spacer()
                                        .frame(width: 16)
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(button.text)
                                            .font(.custom("Inter", size: 16))
                                            .foregroundColor(getRGBColor(36, 41, 47, 1))
                                        if let subtitle1 = button.subtitle1{
                                            Text(subtitle1)
                                                .font(.custom("Inter", size: 12))
                                                .fontWeight(.regular)
                                                .foregroundColor(getRGBColor(102, 118, 134, 1))
                                        }
                                    }
                                    Spacer()
                                    if let availables = button.availables{
                                        ZStack{
                                            RoundedRectangle(cornerRadius:8)
                                                .stroke(getRGBColor(79, 190, 159,1), lineWidth: 1)
                                                .frame(width: 78.69, height: 21.21)
                                            Text(availables)
                                                .font(.custom("Inter", size: 12))
                                                .foregroundColor(getRGBColor(79, 190, 159,1))
                                        }
                                    }
                                }
                                .padding(.horizontal,button.padding)
                            }
                            .frame(width: 345)
                        }
                        .buttonStyle(.plain)
                    }
                }
          }
          .frame(maxWidth: .infinity)
      }
      .background(getRGBColor(245, 247, 247,1))
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
  HomeView2()
}
