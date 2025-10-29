//
//  FriendButton.swift
//  HACOHub
//
//  Created by RIKI on 2025/10/29.
//
import SwiftUI

struct FriendButton: View {
    let friendImage: Image
    let name: String
    let address: String

    var body: some View {
        Button(action: {
            // ボタンを押した時の処理
        }) {
            HStack(spacing: 16) {
                friendImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    

                VStack(alignment: .leading, spacing: 4) {
                    Text.sfProRegular(name, size: 16)
                        .foregroundColor(getRGBColor(30, 41, 57))
                        
                    
                    HStack(spacing: 6) {
                        Image("GreyMapIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                            
                        
                        Text(address)
                            .font(.system(size: 13))
                            .foregroundColor(Color(
                                red: 110/255,
                                green: 119/255,
                                blue: 129/255))
                            
                    }
                }

                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.leading, 16)
            .background(.white)
            .cornerRadius(14)
        }
    }
}

#Preview {
    ZStack {
        getRGBColor(30, 40, 50)
        
        // ダミーデータを複数渡してテスト
        VStack(spacing: 16) {
            FriendButton(
                friendImage: Image("LukaMoretti"),
                name: "Luka Moretti",
                address: "Atlanta, GA"
            )
            FriendButton(
                friendImage: Image("AishaKhan"),
                name: "Aisha Khan",
                address: "Dallas, TX"
            )
            FriendButton(
                friendImage: Image("ElenaRojas"),
                name: "Elena Rojas",
                address: "Los Angeles, CA"
            )
            FriendButton(
                friendImage: Image("OmarAISayed"),
                name: "Omar AI-Sayed",
                address: "Seattle, WA"
            )
            FriendButton(
                friendImage: Image("SofiaPetrova"),
                name: "Sofia Petrova",
                address: "Forest, MS"
            )
            FriendButton(
                friendImage: Image("MiaKhan"),
                name: "Mia Khan",
                address: "Dallas, TX"
            )
            
        }
    }
}
