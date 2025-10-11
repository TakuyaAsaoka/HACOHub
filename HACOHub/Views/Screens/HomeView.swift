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
      VStack {
        HStack {
          HStack{
            Image("GrayLocationOnFilled")
            VStack{
              Text.sfProRegular("CurrentLocation", size: 12)
                .foregroundColor(getRGBColor(66, 74, 83))
              Text.sfProBold("Atlanta, GA", size: 16)
                .foregroundColor(getRGBColor(66, 74, 83))
            }
          }
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
        ZStack(alignment: .top){
          //大きな円
          Circle()
            .foregroundColor(getRGBColor(236, 249, 243))
//            .frame(width: bigCirclesize, height: bigCirclesize)
            .clipped()
          //
          Group{
            //                      //小さな円１
            //                      Button {
            //                          // TODO: 通知一覧を表示する
            //                          print()
            //                      } label: {
            //                          ZStack{
            //                              Circle()
            //                                  .foregroundColor(getRGBColor(255, 235, 220))
            //                                  .frame(width: smallCirclesize, height: smallCirclesize)
            //
            //                              VStack(spacing:0){
            //                                  Image("EventIcon")
            //                                      .resizable()
            //                                      .frame(width: 64, height: 64)
            //                                  Text("Event")
            //                                      .font(.system(size: 24, weight: .bold))
            //                                      .foregroundColor(.black)
            //                                      .multilineTextAlignment(.center).font(.caption)
            //                              }
            //                          }
            //                      }
            //                          .position(x:154 + smallCircleRadius, y: 27 + smallCircleRadius)
            //
            //
            //                      //小さな円2
            //                      Button {
            //                          // TODO: 通知一覧を表示する
            //                          print()
            //                      } label: {
            //                          ZStack{
            //                              Circle()
            //                                  .foregroundColor(getRGBColor(255, 248, 222))
            //                                  .frame(width: smallCirclesize, height: smallCirclesize)
            //
            //                              VStack(spacing:0){
            //                                  Image("DeliveryIcon")
            //                                      .resizable()
            //                                      .frame(width: 64, height: 64)
            //                                  Text("Delivery")
            //                                      .font(.system(size: 24, weight: .bold))
            //                                      .foregroundColor(.black)
            //                                      .multilineTextAlignment(.center).font(.caption)
            //                              }
            //                          }
            //                      }
            //                          .position(x:353 + smallCircleRadius, y:30 + smallCircleRadius)
            //
            //                      //小さな円3
            //                      Button {
            //                          // TODO: 通知一覧を表示する
            //                          print()
            //                      } label: {
            //                          ZStack{
            //                              Circle()
            //                                  .foregroundColor(getRGBColor(222, 237, 255))
            //                                  .frame(width: smallCirclesize, height: smallCirclesize)
            //
            //                              VStack(spacing:0){
            //                                  Image("MedicalIcon")
            //                                      .resizable()
            //                                      .frame(width: 64, height: 64)
            //                                  Text("Medical")
            //                                      .font(.system(size: 24, weight: .bold))
            //                                      .foregroundColor(.black)
            //                                      .multilineTextAlignment(.center).font(.caption)
            //                              }
            //                          }
            //                      }
            //                          .position(x:118 + smallCircleRadius, y:193 + smallCircleRadius)
            //
            //                      //小さな円4
            //                      Button {
            //                          // TODO: 通知一覧を表示する
            //                          print()
            //                      } label: {
            //                          ZStack{
            //                              Circle()
            //                                  .foregroundColor(getRGBColor(210, 247, 222))
            //                                  .frame(width: smallCirclesize, height: smallCirclesize)
            //
            //                              VStack(spacing:0){
            //                                  Image("SendIcon")
            //                                      .resizable()
            //                                      .frame(width: 64, height: 64)
            //                                  Text("Send")
            //                                      .font(.system(size: 24, weight: .bold))
            //                                      .foregroundColor(.black)
            //                                      .multilineTextAlignment(.center).font(.caption)
            //                              }
            //                          }
            //                      }
            //                          .position(x:271 + smallCircleRadius, y:160 + smallCircleRadius)
            //
            //                      //小さな円5
            //                      Button {
            //                          // TODO: 通知一覧を表示する
            //                          print()
            //                      } label: {
            //                          ZStack{
            //                              Circle()
            //                                  .foregroundColor(getRGBColor(243, 231, 255))
            //                                  .frame(width: smallCirclesize, height: smallCirclesize)
            //
            //                              VStack(spacing:0){
            //                                  Image("LentIcon")
            //                                      .resizable()
            //                                      .frame(width: 64, height: 64)
            //                                  Text("Lent")
            //                                      .font(.system(size: 24, weight: .bold))
            //                                      .foregroundColor(.black)
            //                                      .multilineTextAlignment(.center).font(.caption)
            //                              }
            //                          }
            //                      }
            //                          .position(x:168 + smallCircleRadius, y:345 + smallCircleRadius)
            //
            //                      //小さな円6
            //                      Button {
            //                          // TODO: 通知一覧を表示する
            //                          print()
            //                      } label: {
            //                          ZStack{
            //                              Circle()
            //                                  .foregroundColor(getRGBColor(255, 235, 235))
            //                                  .frame(width: smallCirclesize, height: smallCirclesize)
            //
            //                              VStack(spacing:0){
            //                                  Image("BooksIcon")
            //                                      .resizable()
            //                                      .frame(width: 64, height: 64)
            //                                  Text("Books")
            //                                      .font(.system(size: 24, weight: .bold))
            //                                      .foregroundColor(.black)
            //                                      .multilineTextAlignment(.center).font(.caption)
            //                              }
            //                          }
            //                      }
            //                          .position(x:344 + smallCircleRadius, y:303 + smallCircleRadius)

            //小さな円7
            Button {
              // TODO: 通知一覧を表示する
              print()
            } label: {
              ZStack{
                Circle()
                  .foregroundColor(getRGBColor(205, 246, 250))
                  .frame(width: smallCirclesize, height: smallCirclesize)

                VStack(spacing:0){
                  Image("EducationIcon")
                    .resizable()
                    .frame(width: 64, height: 64)
                  Text("Education")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center).font(.caption)
                }
              }
            }
            //                          .position(x:338 + smallCircleRadius, y:457 + smallCircleRadius)

          }
          .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)

          //HacoHubIcon挿入
          let imagewidth: CGFloat = 195
          let imageheight: CGFloat = 195
          //              Image("HacoHubIcon")
          //                  .resizable()
          //                  .scaledToFit()
          //                  .frame(width: imagewidth, height: imageheight)
          //                  .border(.blue)
          //                  .position(x:118 + imagewidth / 2, y:471 + imageheight / 2)
        }
        //              .frame(width: .infinity, height: .infinity)
        .border(.red)
      }
      .ignoresSafeArea()
      .border(.blue)
      .frame(width: geomerty.size.width, height: .infinity)
    }
  }
}

#Preview {
  HomeView()
}
