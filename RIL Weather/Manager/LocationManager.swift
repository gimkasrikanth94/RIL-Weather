//
//  LocationManager.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        isLoading = true
        manager.requestLocation()
        let lat = UserDefaults.standard.double(forKey: "locationLat")
        let lng = UserDefaults.standard.double(forKey: "locationLng")
        if lat != 0 && lng != 0 {
            location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
            isLoading = false
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("not determined - hence ask for Permission")
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("permission denied")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Apple delegate gives the call back here once user taps Allow option, Make sure delegate is set to self")
        @unknown default:
            print("Unknown")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        if let coordinates = location{
            UserDefaults.standard.set(coordinates.latitude, forKey: "locationLat")
            UserDefaults.standard.set(coordinates.longitude, forKey: "locationLng")
        }
        isLoading = false
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }

}
