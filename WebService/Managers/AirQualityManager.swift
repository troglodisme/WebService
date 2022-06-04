//
//  AirQualityManager.swift
//  WebService
//
//  Created by Giulio Ammendola on 04/06/2022.
//

import Foundation
import CoreLocation
import Alamofire

class AirQualityManager: ObservableObject {
    
    @Published var aqiValue = ""
    @Published var aqiIcon = ""

    func getAirAquality(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
                
        let KEY = "cbbf654a1956664b0c183ba26f389799"
        let URL =  "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(latitude)&lon=\(longitude)&appid=\(KEY)&units=metric"
        
        print("Compiled AQI URL: \(URL)")
        
        AF.request(URL).responseDecodable(of: AirQuality.self) { [self] response in
            
            if let aqi = response.value?.list[0].main.aqi {
                
                print("aqi is \(aqi)")
                
                if aqi == 1 {
                    self.aqiValue = "Air quality here is: Good"
                    self.aqiIcon = "aqi.low"                    
                }
                
                if aqi == 2 {
                    self.aqiValue = "Air quality here is: Fair"
                    self.aqiIcon = "aqi.low"

                }
                
                if aqi == 3 {
                    self.aqiValue = "Air quality here is: Moderate"
                    self.aqiIcon = "aqi.medium"
                }
                
                if aqi == 4 {
                    self.aqiValue = "Air quality here is: Poor"
                    self.aqiIcon = "aqi.high"
                }
                
                if aqi == 5 {
                    self.aqiValue = "Air quality here is: Very Poor"
                    self.aqiIcon = "aqi.high"

                }
            }
            
            
        }
        
        
    }
}
