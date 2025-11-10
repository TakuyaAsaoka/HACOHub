//
//  ChangePickUpLocation.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct ChangePickUpLocationView: View {
	@Binding var path: NavigationPath
	@EnvironmentObject var receiveStore: ReceiveStore
	
	var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
			
			VStack(alignment: .leading, spacing: 0) {
				NormalHeader(path: $path, title: "Receive")

        VStack(alignment: .leading, spacing: 8) {
          ScrollView {
            VStack(alignment: .leading, spacing: 16) {
              HStack {
                Text.sfProRegular("Your item", size: 16)
                  .foregroundColor(getRGBColor(54, 65, 83))
                Spacer()
              }

              YourItemCard()

              HStack {
                Text.sfProRegular("Select pickup location", size: 16)
                  .foregroundColor(getRGBColor(54, 65, 83))
                Spacer()
              }

              VStack(spacing: 8) {
                HStack {
                  Text.sfProRegular("Search or enter location", size: 14)
                    .foregroundColor(getRGBColor(66, 74, 83))
                  Spacer()
                }

                InputBoxView(
                  imageName: "GreenLocationIcon",
                  text: $receiveStore.location,
                  placeholder: "Enter pickup location"
                )
              }

              MapPickerView(
                latitude: $receiveStore.latitude,
                longitude: $receiveStore.longitude,
                location: $receiveStore.location
              )
              .frame(height: 210)
              .frame(maxWidth: .infinity, alignment: .leading)

              HStack {
                Text.sfProRegular("Select pickup time", size: 16)
                  .foregroundColor(getRGBColor(66, 74, 83))
                Spacer()
              }

              HStack(spacing: 18) {
                Image("GreenClockIcon")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 20, height: 20)

                VStack(alignment: .leading, spacing: 2) {
                  Text.sfProRegular("Date", size: 12)
                    .foregroundColor(getRGBColor(110, 119, 129))
                  DatePickerView(textSize: 16, selectedDate: $receiveStore.date)
                }
                .frame(width: 168, alignment: .leading)

                VStack(alignment: .leading, spacing: 2) {
                  Text.sfProRegular("Time", size: 12)
                    .foregroundColor(getRGBColor(110, 119, 129))
                  TimePickerView(textSize: 16, selectedTime: $receiveStore.date)
                }
              }
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.vertical, 12)
              .padding(.leading, 12)
              .background(.white)
              .cornerRadius(8)
            }
          }
          .scrollIndicators(.hidden)
          .padding(.horizontal, 20)
          .padding(.top, 20)
          .padding(.bottom, 8)

          PrimaryRoundedButton(
            text: "Confirm",
            weight: .bold,
						size: 20,
						vPadding: 20,
						radius: 16,
						action: {
							path.append(Route.receiveConfirmAndPay)
						}
					)
					.padding(.top, 24)
					.padding(.bottom, 36)
					.padding(.horizontal, 24)
					.background(.white)
				}
			}
		}
		.ignoresSafeArea()
	}
}

#Preview {
	ChangePickUpLocationView(path: .constant(NavigationPath()))
		.environmentObject(ReceiveStore())
}
