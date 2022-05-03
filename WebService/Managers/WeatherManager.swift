//
//  WeatherManager.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.


import Foundation
import CoreLocation
import Alamofire

class WeatherManager: ObservableObject {
    
    @Published var cityValue = ""
    @Published var latValue = 0.0
    @Published var lonValue = 0.0
    @Published var mainValue = ""
    @Published var descriptionValue = ""
    @Published var tempeartureValue = 0.0
    @Published var icon = ""


    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        print("current lat \(latitude)")
        print("current long \(longitude)")
        
        let KEY = "cbbf654a1956664b0c183ba26f389799"
        let URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(KEY)&units=metric"
        
        print(URL)
        
        AF.request(URL).responseDecodable(of: WeatherAPI.self) { [self] response in
            
            if let description = response.value?.weather[0].weatherDescription {
                self.descriptionValue = description
                print(description)
                print("value \(descriptionValue)" )
            }

            if let temperature = response.value?.main.temp {
                self.tempeartureValue = temperature
                print(temperature)
            }
                            
            if let cityName = response.value?.name {
                self.cityValue = cityName
                print(cityName)
            } else {
                print("no city")
            }
            
            if let icon = response.value?.weather[0].icon {
                self.icon = icon
                print(icon)
            } 

//            if let latitude = response.value?.coord.lat {
//                self.latValue = latitude
//                print("lat \(latitude)")
//            }
//
//            if let longitude = response.value?.coord.lon {
//                self.lonValue = longitude
//                print("lon \(longitude)")
//            }

                    
    }

 }
}
