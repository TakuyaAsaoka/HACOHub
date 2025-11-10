//
//  ReceiveView.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct ReceiveView: View {
	@Binding var path: NavigationPath
	@State private var isScanModalView: Bool = false
	
	var body: some View {
		VStack(spacing: 0) {
			NormalHeader(path: $path, title: "Receive")
			
			ZStack {
				getRGBColor(245, 247, 247)
				
				VStack(alignment: .leading, spacing: 8) {
					ScrollView {
						HStack {
							Text.sfProRegular("Your items", size: 16)
								.foregroundColor(getRGBColor(54, 65, 83))
							Spacer()
						}
					
						ReceiveCard(path: $path, isShowingQR: $isScanModalView)
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
		.ignoresSafeArea()
	}
}

#Preview {
	ReceiveView(path: .constant(NavigationPath()))
    .environmentObject(ReceiveStore())
}
