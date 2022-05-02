//
//  WeatherManager.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.


import Foundation
import CoreLocation
import Alamofire

class WeatherManager {

    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        print("lat \(latitude)")
        print("long \(longitude)")
        
        let KEY = "cbbf654a1956664b0c183ba26f389799"
        
        let URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)lon=\(longitude)&appid=\(KEY)&units=metric"
        
        AF.request(URL).responseDecodable(of: WeatherAPI.self) { response in
            
            if let description = response.value?.weather[0].weatherDescription {
//                weather.descriptionValue = description
                print(description)
            }

            if let temperature = response.value?.main.temp {
//                weather.tempeartureValue = temperature
                print(temperature)
            }
            
            
    }

 }
}
