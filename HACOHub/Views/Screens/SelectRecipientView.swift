//
//  SelectRecipientView.swift
//  HACOHub
//
//  Created by RIKI on 2025/10/29.
//
import SwiftUI

struct SelectRecipientView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {

                Text.sfProRegular("Select recipient", size: 16,)
                    .foregroundColor(getRGBColor(54, 54, 83))
                Text.sfProRegular("Recent recipients", size: 14)
                    .foregroundColor(getRGBColor(106, 114, 130))

                
                VStack(spacing: 12) {
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
                }
                
                Text.sfProRegular("Saved addresses", size: 14)
                    .foregroundColor(getRGBColor(106, 114, 130))
                    .frame(height: 20)
                    
                VStack(spacing: 12) {
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
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .background(getRGBColor(240, 242, 245))
    }
}

#Preview {
    SelectRecipientView()
        .ignoresSafeArea()
}
