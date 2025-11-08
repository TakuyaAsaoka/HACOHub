//
//  FriendButton.swift
//  HACOHub
//
//  Created by RIKI on 2025/10/29.
//
import SwiftUI

struct FriendButton: View {
	let friendImage: Image
	let friend: FriendInfo
	@Binding var storeFriend: FriendInfo

    var body: some View {
			Button {
				storeFriend = friend
			} label: {
            HStack(spacing: 16) {
                friendImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                    
                VStack(alignment: .leading, spacing: 4) {
									Text.sfProRegular(friend.name, size: 16)
                        .foregroundColor(getRGBColor(30, 41, 57))
                        
                    HStack(spacing: 6) {
                        Image("GreyMapIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 14, height: 14)
                        
											Text.sfProRegular(friend.address, size: 13)
												.foregroundColor(getRGBColor(110, 119, 129))
                    }
                }

                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.leading, 16)
						.background(
							(storeFriend.name == friend.name)
										? getRGBColor(236, 249, 243)
										: .white
						)
						.overlay(
								RoundedRectangle(cornerRadius: 14)
									.stroke((storeFriend.name == friend.name)
                          ? Color.pri : .white, lineWidth: 2)
						)
            .cornerRadius(14)
        }
    }
}
