//
//  SendView.swift
//  HACOHub
//
//  Created by user on 2025/10/30.
//

import SwiftUI

struct SendView: View {
	@StateObject private var sendStore = SendStore()
	@Binding var path: NavigationPath
	@State var currentScreen: Int = 0
	@State var oldScreen: Int = -1
	@State var currentFlow: Bool = true
	@State var oldFlow: Bool = true
	
	var body: some View {
		PhaseLayoutView(
			path: $path,
			title: "Send",
			steps: sendSteps,
			currentScreen: $currentScreen,
			oldScreen: $oldScreen,
			currentFlow: $currentFlow,
			oldFlow: $oldFlow,
			content: {
				SendContentView(
					currentScreen: $currentScreen,
					oldScreen: $oldScreen,
					currentFlow: $currentFlow,
					oldFlow: $oldFlow
				)
					.environmentObject(sendStore)
			},
			buttonText: "Next",
			action: {
				oldFlow = currentFlow
				currentFlow = true
				oldScreen = currentScreen
				if currentScreen == 0 || currentScreen == 1 {
					currentScreen += 1
				} else if currentScreen == 2 {
					path.append(Route.confirmAndPay)
				}
			}
		)
	}
}

struct SendContentView: View {
	@Binding var currentScreen: Int
	@Binding var oldScreen: Int
	@Binding var currentFlow: Bool
	@Binding var oldFlow: Bool
	@State private var isMovingForward: Bool = true
	
	var body: some View {
		ZStack {
//			// 画面1
//			if currentScreen == 0 {
//				ShippingDetailContentView()
//					.transition(currentFlow == oldFlow ? transitionDirection : reverseTransitionDirection)
//			}
//			// 画面2
//			if currentScreen == 1 {
//				DeliveryDetailContentView()
//					.transition(currentFlow == oldFlow ? transitionDirection : reverseTransitionDirection)
//			}
//			// 画面3
//			if currentScreen == 2 {
//				SelectHacoHubContentView()
//					.transition(currentFlow == oldFlow ? transitionDirection : reverseTransitionDirection)
//			}
			Group {
								switch currentScreen {
								case 0:
										ShippingDetailContentView()
								case 1:
										DeliveryDetailContentView()
								case 2:
										SelectHacoHubContentView()
								default:
										EmptyView()
								}
						}
						.transition(transitionDirection)
		}
		.animation(.easeInOut, value: currentScreen)
		.onChange(of: currentScreen) {
				isMovingForward = currentScreen > oldScreen
				oldScreen = currentScreen
		}
	}
	
//	private var transitionDirection: AnyTransition {
//		print("currentScreen: \(currentScreen), oldScreen: \(oldScreen)")
//			if currentScreen > oldScreen {
//					// 進む：右→左
//					return AnyTransition.asymmetric(
//							insertion: .move(edge: .trailing),
//							removal: .move(edge: .leading)
//					)
//			} else if currentScreen < oldScreen {
//					// 戻る：左→右
//					return AnyTransition.asymmetric(
//							insertion: .move(edge: .leading),
//							removal: .move(edge: .trailing)
//					)
//			} else {
//					return .identity
//			}
//	}
	
	private var transitionDirection: AnyTransition {
			if isMovingForward {
					// 次へ進む：右→左
					return .asymmetric(
							insertion: .move(edge: .trailing),
							removal: .move(edge: .leading)
					)
			} else {
					// 戻る：左→右
					return .asymmetric(
							insertion: .move(edge: .leading),
							removal: .move(edge: .trailing)
					)
			}
	}
}

#Preview {
	SendView(path: .constant(NavigationPath()))
}
