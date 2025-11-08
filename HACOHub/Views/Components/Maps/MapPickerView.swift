//
//  MapWithPin.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI
import MapKit

struct MapPickerView: View {
  @Binding var latitude: CLLocationDegrees
  @Binding var longitude: CLLocationDegrees
  @Binding var location: String?

  @State private var cameraPosition: MapCameraPosition
  @State private var geocodeWorkItem: DispatchWorkItem?
  @State private var didInitialLoad = false

  init(
    latitude: Binding<CLLocationDegrees>,
    longitude: Binding<CLLocationDegrees>,
    location: Binding<String?>
  ) {
    self._latitude = latitude
    self._longitude = longitude
    self._location = location

    let center = CLLocationCoordinate2D(
      latitude: latitude.wrappedValue,
      longitude: longitude.wrappedValue
    )
    self._cameraPosition = State(
      initialValue: MapCameraPosition.camera(
        MapCamera(
          centerCoordinate: center,
          distance: 1000
        )
    ))
  }

  var body: some View {
    ZStack {
      Map(
        position: $cameraPosition,
        interactionModes: .all
      ) {}
      .onMapCameraChange { context in
        geocodeWorkItem?.cancel()

        let newCenter = context.camera.centerCoordinate

        let workItem = DispatchWorkItem { [newCenter] in
          if didInitialLoad {
            let clLocation = CLLocation(latitude: newCenter.latitude, longitude: newCenter.longitude)
            Task {
              latitude = clLocation.coordinate.latitude
              longitude = clLocation.coordinate.longitude
              location = await fetchAddress(location: clLocation)
            }
          } else {
            didInitialLoad = true
          }
        }

        geocodeWorkItem = workItem
        DispatchQueue.main.asyncAfter(
          deadline: .now() + 0.2, execute: workItem
        )
      }

      Image("RedPinIcon")
        .resizable()
        .frame(width: 18, height: 30)
        .foregroundColor(.red)
        .offset(y: -15) // height/2だけ上にずらしてピンの先端をMapの中心に刺す
    }
  }

  func fetchAddress(location: CLLocation) async -> String? {
    guard let request = MKReverseGeocodingRequest(location: location) else { return nil }
    request.preferredLocale = Locale(identifier: "en_US")

    do {
      let mapItems = try await request.mapItems
      guard let mapItem = mapItems.first else { return nil }
      return mapItem.address?.fullAddress
    } catch {
      print("Reverse geocode failed: \(error)")
      return nil
    }
  }
}

#Preview {
	MapPickerView(
    latitude: .constant(33.7518510),
    longitude: .constant(-84.3853718),
		location: .constant("test")
	)
}
