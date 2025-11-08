//
//  MapWithPin.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI
import MapKit

struct MapWithPinView: View {
	let latitude: CLLocationDegrees
	let longitude: CLLocationDegrees
	
	@State private var region: MKCoordinateRegion
	@State private var centerCoordinate: CLLocationCoordinate2D
	@Binding var location: String
	@State private var geocodeWorkItem: DispatchWorkItem?
	@State private var didInitialLoad = false

	init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, location: Binding<String>) {
		self.latitude = latitude
		self.longitude = longitude
		self._location = location
		
		let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		 
		 _centerCoordinate = State(initialValue: coordinate)
		 _region = State(initialValue: MKCoordinateRegion(
				 center: coordinate,
				 span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
		 ))
	}

	var body: some View {
		VStack {
			InputBoxView(imageName: "GreenLocationIcon", text: $location)
			
			ZStack {
				Map(coordinateRegion: $region, interactionModes: .all)
						.onChange(of: region.center) { newCenter in
							centerCoordinate = newCenter

							geocodeWorkItem?.cancel()
							
							let workItem = DispatchWorkItem { [newCenter] in
									 // 最初のロード時は住所を変更しない
									 if didInitialLoad {
											 fetchAddress(for: newCenter)
									 } else {
											 // 初回ロード完了後にフラグを true に
											 didInitialLoad = true
									 }
							 }
							geocodeWorkItem = workItem
							DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: workItem)
						}
					
				Image("RedPinIcon")
					.font(.system(size: 40))
					.foregroundColor(.red)
					.offset(y: -20)
			}
		}
	}
	
	func fetchAddress(for coordinate: CLLocationCoordinate2D) {
		let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
		let geocoder = CLGeocoder()
		
		// 英語（アメリカ）で住所を取得
		geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "en_US")) { placemarks, error in
			if let placemark = placemarks?.first {
				let address = [
					placemark.subThoroughfare,     // 番地
					placemark.thoroughfare,        // 通り名
					placemark.subLocality,         // 区や町名
					placemark.locality,            // 市
					placemark.administrativeArea,  // 州
					placemark.postalCode,          // 郵便番号
					placemark.country              // 国
				].compactMap { $0 }.joined(separator: ", ")
				
				DispatchQueue.main.async {
					self.location = address.isEmpty ? "Address not available" : address
				}
			} else if let error = error {
				DispatchQueue.main.async {
					self.location = "Geocode error: \(error.localizedDescription)"
				}
			}
		}
	}
}

#Preview {
	MapWithPinView(
		latitude: 33.7518510,
		longitude: -84.3853718,
		location: .constant("test")
	)
}
