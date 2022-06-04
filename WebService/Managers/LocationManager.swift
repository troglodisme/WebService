//
//  LocationManager.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.
//
//

import Foundation
import CoreLocation
import MapKit

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    @Published var cityLocation = ""
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        isLoading = true
        locationManager.requestLocation()
//        locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.first else { return }
        isLoading = false
        
        DispatchQueue.main.async {
            self.location = location.coordinate
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }
        
        //convert to city location
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler:
            {
                placemarks, error -> Void in

                // Place details
                guard let placeMark = placemarks?.first else { return }

                // Location name
                if let locationName = placeMark.location {
                    print(locationName)
                }
                // Street address
                if let street = placeMark.thoroughfare {
                    print(street)
                }
                // City
                if let city = placeMark.subAdministrativeArea {
                    print(city)
                    self.cityLocation = city
                    print("your city is: \(self.cityLocation )")
                }
                // Zip code
                if let zip = placeMark.isoCountryCode {
                    print(zip)
                }
                // Country
                if let country = placeMark.country {
                    print(country)
                }
        })
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //Handle any errors here...
        isLoading = false
        print (error)
    }
    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkLocationAuthorization()
//    }
//
//    private func checkLocationAuthorization() {
//
//        switch locationManager.authorizationStatus {
//
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            print("Your location is restricted.")
//        case .denied:
//            print("You have denied location to the app.")
//        case .authorizedAlways, .authorizedWhenInUse:
//            break
//        @unknown default:
//            break
//        }
//
//    }
}
