//
//  MapWithPin.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI
import MapKit

struct MapWithPinView: View {
	@State private var region = MKCoordinateRegion(
			center: CLLocationCoordinate2D(latitude: 33.759987, longitude: -84.393362),
			span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
	)
	
	@State private var centerCoordinate = CLLocationCoordinate2D(latitude: 33.759987, longitude: -84.393362)
	@State private var address: String = "住所を取得中..."
	@State private var geocodeWorkItem: DispatchWorkItem?
	let mapHeight: CGFloat
	
	var body: some View {
		VStack {
			ZStack {
				Map(coordinateRegion: $region, interactionModes: .all)
						.onChange(of: region.center) { newCenter in
							centerCoordinate = newCenter
							// 古いリクエストをキャンセル
							geocodeWorkItem?.cancel()
							
							// 新しいリクエストを0.2秒後に実行
							let workItem = DispatchWorkItem { [newCenter] in
									fetchAddress(for: newCenter)
							}
							geocodeWorkItem = workItem
							DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: workItem)
							
							print("onChange: center moved")
						}
						.frame(height: mapHeight)
					
				Image("RedPinIcon")
					.font(.system(size: 40))
					.foregroundColor(.red)
					.offset(y: -20)
			}
				
			// 取得した座標情報
			VStack(alignment: .leading) {
					Text("緯度: \(centerCoordinate.latitude)")
					Text("経度: \(centerCoordinate.longitude)")
					Text("住所: \(address)")
			}
			.padding()
		}
	}
	
	// 逆ジオコーディングで住所を取得
	func fetchAddress(for coordinate: CLLocationCoordinate2D) {
		print("coordinates: \(coordinate)")
			let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
			CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
					if let placemark = placemarks?.first {
							let address = [
									placemark.administrativeArea, // 都道府県
									placemark.locality,            // 市区町村
									placemark.thoroughfare         // 通り名
							].compactMap { $0 }.joined()
							
							DispatchQueue.main.async {
									self.address = address.isEmpty ? "住所を取得できません" : address
							}
					}
			}
	}
}

#Preview {
	MapWithPinView(
		mapHeight: 354
	)
}
