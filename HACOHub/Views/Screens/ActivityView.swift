//
//  ActivityView.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct ActivityView: View {
	@State var isScanModalView: Bool = false
	
	var body: some View {
		ZStack {
			getRGBColor(245, 247, 247)
			
			VStack(alignment: .leading, spacing: 8) {
				ScrollView {
					HStack {
						
				Text.sfProRegular("Upcoming", size: 16)
					.foregroundColor(getRGBColor(54, 65, 83))
						Spacer()
					}
				
				UpcomingCard(isShowingQR: $isScanModalView)
				Spacer()
				}
			}
			.padding(20)
			
			if isScanModalView {
				ScanModalView(isPresented: $isScanModalView)
					.onTapGesture {
						isScanModalView = false
					}
			}
		}
	}
}

#Preview {
    ActivityView()
}
