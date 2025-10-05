//
//  LocationManager.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/05.
//

import Foundation
import CoreLocation
import MapKit
internal import Combine

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  @Published var currentLocation: CLLocationCoordinate2D? = CLLocationCoordinate2D(latitude: 33.759136, longitude: -84.389453)
  private var manager = CLLocationManager()

  override init() {
    super.init()
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Location error: \(error)")
  }
}
