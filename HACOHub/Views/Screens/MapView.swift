//
//  MapView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/04.
//

import SwiftUI
import MapKit

struct MapView: View {
  @State var isHideUnusedLockers: Bool = false
	@State var selectedLocker: CLLocationCoordinate2D? = nil
  @State private var position: MapCameraPosition = .region(
    MKCoordinateRegion(
      center: CLLocationCoordinate2D(latitude: 33.759987, longitude: -84.393362),
      // TODO: 何の数字にしても効かん
      span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
    )
  )

  let fixedLocation = CLLocationCoordinate2D(
    latitude: 33.759987,
    longitude: -84.393362
  )

  let unusedLockers: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 33.760985, longitude: -84.393504),
    CLLocationCoordinate2D(latitude: 33.760400, longitude: -84.393110),
    CLLocationCoordinate2D(latitude: 33.760286, longitude: -84.393512),
    CLLocationCoordinate2D(latitude: 33.759794, longitude: -84.394542),
    CLLocationCoordinate2D(latitude: 33.758844, longitude: -84.393107),
    CLLocationCoordinate2D(latitude: 33.758737, longitude: -84.393273),
    CLLocationCoordinate2D(latitude: 33.758985, longitude: -84.392559),
    CLLocationCoordinate2D(latitude: 33.758681, longitude: -84.393695),
    CLLocationCoordinate2D(latitude: 33.758730, longitude: -84.392809),
    CLLocationCoordinate2D(latitude: 33.758300, longitude: -84.393381),
  ]

  let usedLocker: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 33.758534, longitude: -84.393106)

  var body: some View {
		ZStack {
			Map {
					ForEach(Array(unusedLockers.enumerated()), id: \.offset) { index, locker in
							Annotation("", coordinate: locker) {
									if !isHideUnusedLockers {
											Button {
													//              isShowingEventMap = true
											} label: {
													Image("UnusedLockerIcon")
															.resizable()
															.scaledToFit()
															.frame(width: 43, height: 60)
											}
											.accessibilityHidden(true)
									}
							}
					}
					Annotation("", coordinate: usedLocker) {
						VStack {
							
						
							Button {
								if selectedLocker == usedLocker {
									selectedLocker = nil
								} else {
									selectedLocker = usedLocker
								}
							} label: {
									Image("UsedLockerIcon")
										.resizable()
										.scaledToFit()
										.frame(width: 43, height: 60)
							}
						}
					}
					Annotation("", coordinate: fixedLocation) {
							Image("CurrentLocationPin")
									.resizable()
									.scaledToFit()
									.frame(width: 26.25, height: 37.5)
									.accessibilityHidden(true)
					}
			}
			
			VStack {
				HStack {
					Spacer()
					Button {
						isHideUnusedLockers.toggle()
					} label: {
						VStack(spacing: 0) {
							Image(isHideUnusedLockers ? "EyeSlashIcon" : "EyeIcon")
								.resizable()
								.scaledToFit()
								.frame(width: 36, height: 36)
							Text.sfProRegular(isHideUnusedLockers ? "Hide Others" : "Show All", size: 13)
								.foregroundColor(getRGBColor(110, 119, 129))
						}
						.frame(width: 74)
					}
				}
				Spacer()
			}
			.padding(.trailing, 10)
			.padding(.top, 8)
		}
	}
}

extension CLLocationCoordinate2D: @retroactive Equatable {
	public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
			return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
	}
}

#Preview {
    MapView()
}
