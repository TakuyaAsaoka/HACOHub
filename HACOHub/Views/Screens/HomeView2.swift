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
                                      //.padding(button.)
                                      //.padding(button.padding)
                                      .padding(.bottom, button.padding)
                                      
                                  
                                  
                                  
                              }
                              //.padding(8)
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
                  Text("Poplar Use Case")
                      .font(.custom("Inter", size: 16))
                      .fontWeight(.regular)
                      .lineSpacing(24 - 16)
                      .tracking(-0.31)
                  //.frame(width: 345, alignment: .leading)
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
                  .padding(.trailing, 18.47)
                  
                  
              }
              .frame(width: 345)
              
              Spacer()
                  .frame(height: 16)
              
              Button {
                  situation = .airport
              } label: {
                  ZStack{
                      RoundedRectangle(cornerRadius:16)
                          .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    getRGBColor(43, 127, 255, 1),
                                    getRGBColor(0, 184, 219, 1)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                          )
                          .frame(width: 345, height: 96)
                          .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                      HStack{
                          Image("AirPortIcon")
                          
                          Spacer()
                              .frame(width: 16)
                          
                          VStack(alignment: .leading, spacing: 0){
                              Text("AirPort to Hotel")
                                  .font(.custom("Inter", size: 18))
                                  .fontWeight(.regular)
                                  .lineSpacing(28 - 18)
                                  .tracking(-0.44)
                                  .foregroundColor(Color.white)
                              Text("Send luggage directly")
                                  .font(.custom("Inter", size: 14))
                                  .fontWeight(.regular)
                                  .lineSpacing(20 - 14)
                                  .tracking(-0.15)
                                  .foregroundColor(getRGBColor(255, 255, 255, 0.8))
                              Text("to your hotel")
                                  .font(.custom("Inter", size: 14))
                                  .fontWeight(.regular)
                                  .lineSpacing(20 - 14)
                                  .tracking(-0.15)
                                  .foregroundColor(getRGBColor(255, 255, 255, 0.8))
                              
                          }
                          Spacer()
                          Image("WhiteRightArrow")
                      }
                      .padding(.horizontal, 24)
                      .frame(width: 345, height: 96)
                  }
              }
              .buttonStyle(.plain)
              
              
              Spacer()
                  .frame(height: 11.99)
              
              Button {
                  situation = .event
              } label: {
              
                  ZStack{
                      RoundedRectangle(cornerRadius:16)
                          .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    getRGBColor(173, 70, 255, 1),
                                    getRGBColor(246, 51, 154, 1)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                          )
                          .frame(width: 345, height: 96)
                          .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                      HStack{
                          Image("EventLockerIcon")
                          
                          Spacer()
                              .frame(width: 16)
                          
                          VStack(alignment: .leading, spacing: 0){
                              Text("Event Locker")
                                  .font(.custom("Inter", size: 18))
                                  .fontWeight(.regular)
                                  .lineSpacing(28 - 18)
                                  .tracking(-0.44)
                                  .foregroundColor(Color.white)
                              Text("Store items during events")
                                  .font(.custom("Inter", size: 14))
                                  .fontWeight(.regular)
                                  .lineSpacing(20 - 14)
                                  .tracking(-0.15)
                                  .foregroundColor(getRGBColor(255, 255, 255, 0.8))
                              Text("& concerts")
                                  .font(.custom("Inter", size: 14))
                                  .fontWeight(.regular)
                                  .lineSpacing(20 - 14)
                                  .tracking(-0.15)
                                  .foregroundColor(getRGBColor(255, 255, 255, 0.8))
                              
                          }
                          Spacer()
                          Image("WhiteRightArrow")
                      }
                      .padding(.horizontal, 24)
                      .frame(width: 345, height: 96)
                  }
              }
              .buttonStyle(.plain)
              
              
              Spacer()
                  .frame(height: 11.99)
              Button {
                  situation = .sendtofriend
              } label: {
                  
                  ZStack{
                      RoundedRectangle(cornerRadius:16)
                          .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    getRGBColor(0, 188, 125, 1),
                                    getRGBColor(0, 187, 167, 1)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                          )
                          .frame(width: 345, height: 96)
                          .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                      HStack{
                          Image("SendToFriendIcon")
                          
                          Spacer()
                              .frame(width: 16)
                          
                          VStack(alignment: .leading, spacing: 0){
                              Text("Send to Friend")
                                  .font(.custom("Inter", size: 18))
                                  .fontWeight(.regular)
                                  .lineSpacing(28 - 18)
                                  .tracking(-0.44)
                                  .foregroundColor(Color.white)
                              Text("share items via")
                                  .font(.custom("Inter", size: 14))
                                  .fontWeight(.regular)
                                  .lineSpacing(20 - 14)
                                  .tracking(-0.15)
                                  .foregroundColor(getRGBColor(255, 255, 255, 0.8))
                              Text("secure locker")
                                  .font(.custom("Inter", size: 14))
                                  .fontWeight(.regular)
                                  .lineSpacing(20 - 14)
                                  .tracking(-0.15)
                                  .foregroundColor(getRGBColor(255, 255, 255, 0.8))
                              
                          }
                          Spacer()
                          Image("WhiteRightArrow")
                      }
                      .padding(.horizontal, 24)
                      .frame(width: 345, height: 96)
                      
                  }
              }
              .buttonStyle(.plain)
              
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
              
              ZStack{
                  RoundedRectangle(cornerRadius:16)
                  .frame(width: 345, height: 56)
                  .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                  .foregroundColor(.white)
                  
                  HStack{
                      
                      HStack{
                          Image("NearByIcon")
                          
                          VStack{
                              Text("Shibuya Station")
                                  .font(.custom("Inter", size: 16))
                                  .fontWeight(.regular)
                                  .lineSpacing(24 - 16)       // line-height 24px - font-size 16px
                                  .tracking(-0.31)
                                  .foregroundColor(getRGBColor(30, 41, 57, 1))
                              Text("0.3 km away")
                                  .font(.custom("Inter", size: 12))
                                  .fontWeight(.regular)
                                  .lineSpacing(16 - 12)       // line-height - font-size
                                  .tracking(0)                // letter-spacing 0
                                  .foregroundColor(getRGBColor(106, 114, 130, 1))
                              
                          }
                          Spacer()
                          ZStack{
                              RoundedRectangle(cornerRadius: 8)
                                  .stroke(getRGBColor(79, 190, 159, 1), lineWidth: 1)
                                  .frame(width: 78.69, height: 21.21)
                                  .foregroundColor(.white)
                              
                              
                              Text("5 available")
                                  .font(.custom("Inter", size: 12)) // 文字サイズは適宜調整
                                  .fontWeight(.regular)
                                  .foregroundColor(getRGBColor(79, 190, 159, 1))
                          }
                      }
                      
                      .padding(.horizontal, 24)
                  }
                  .frame(width: 345)
                  
              }
              
              Spacer()
                  .frame(height: 11.99)
              
              ZStack{
                  RoundedRectangle(cornerRadius:16)
                  .frame(width: 345, height: 56)
                  .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                  .foregroundColor(.white)
                  
                  HStack{
                      
                      HStack{
                          Image("NearByIcon")
                          
                          VStack{
                              Text("Omotesando Hills")
                                  .font(.custom("Inter", size: 16))
                                  .fontWeight(.regular)
                                  .lineSpacing(24 - 16)       // line-height 24px - font-size 16px
                                  .tracking(-0.31)
                                  .foregroundColor(getRGBColor(30, 41, 57, 1))
                              Text("0.8 km away")
                                  .font(.custom("Inter", size: 12))
                                  .fontWeight(.regular)
                                  .lineSpacing(16 - 12)       // line-height - font-size
                                  .tracking(0)                // letter-spacing 0
                                  .foregroundColor(getRGBColor(106, 114, 130, 1))
                              
                          }
                          Spacer()
                          ZStack{
                              RoundedRectangle(cornerRadius: 8)
                                  .stroke(getRGBColor(79, 190, 159, 1), lineWidth: 1)
                                  .frame(width: 78.69, height: 21.21)
                                  .foregroundColor(.white)
                              
                              
                              Text("5 available")
                                  .font(.custom("Inter", size: 12)) // 文字サイズは適宜調整
                                  .fontWeight(.regular)
                                  .foregroundColor(getRGBColor(79, 190, 159, 1))
                          }
                      }
                      
                      .padding(.horizontal, 24)
                  }
                  .frame(width: 345)
                  
              }
              
              Spacer()
                  .frame(height: 11.99)
              
              ZStack{
                  RoundedRectangle(cornerRadius:16)
                  .frame(width: 345, height: 56)
                  .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                  .foregroundColor(.white)
                  
                  HStack{
                      
                      HStack{
                          Image("NearByIcon")
                          
                          VStack{
                              Text("Harajuku Center")
                                  .font(.custom("Inter", size: 16))
                                  .fontWeight(.regular)
                                  .lineSpacing(24 - 16)       // line-height 24px - font-size 16px
                                  .tracking(-0.31)
                                  .foregroundColor(getRGBColor(30, 41, 57, 1))
                              Text("1.2 km away")
                                  .font(.custom("Inter", size: 12))
                                  .fontWeight(.regular)
                                  .lineSpacing(16 - 12)       // line-height - font-size
                                  .tracking(0)                // letter-spacing 0
                                  .foregroundColor(getRGBColor(106, 114, 130, 1))
                              
                          }
                          Spacer()
                          ZStack{
                              RoundedRectangle(cornerRadius: 8)
                                  .stroke(getRGBColor(79, 190, 159, 1), lineWidth: 1)
                                  .frame(width: 78.69, height: 21.21)
                                  .foregroundColor(.white)
                              
                              
                              Text("5 available")
                                  .font(.custom("Inter", size: 12)) // 文字サイズは適宜調整
                                  .fontWeight(.regular)
                                  .foregroundColor(getRGBColor(79, 190, 159, 1))
                          }
                      }
                      
                      .padding(.horizontal, 24)
                  }
                  .frame(maxWidth: .infinity)
                  
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
