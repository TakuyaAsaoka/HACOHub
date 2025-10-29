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
	let phone: String
	@Binding var selectedFriend: String?

    var body: some View {
			Button {
				selectedFriend = name
			} label: {
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
						.background(
							(selectedFriend == name)
										? getRGBColor(236, 249, 243)
										: .white
						)
						.overlay(
								RoundedRectangle(cornerRadius: 14)
									.stroke((selectedFriend == name)
														? getRGBColor(79, 190, 159) : .white, lineWidth: 2)
						)
            .cornerRadius(14)
        }
    }
}
