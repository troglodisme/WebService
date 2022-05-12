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
    @Published var icon = ""
    
    @Published var current_dtValue = 0
    @Published var current_tempValue = 0.0

    //daily
    @Published var daily1_sunriseValue = 0
    @Published var daily1_descriptionValue = ""
    @Published var daily1_tempValue_day = 0.0
    @Published var daily1_icon = ""


    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        print("current lat \(latitude)")
        print("current long \(longitude)")
        
        let KEY = "cbbf654a1956664b0c183ba26f389799"
        
//current weather api
//        let URL = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(KEY)&units=metric"

        
//one call api
        let URL = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(KEY)&units=metric"
                
        print("Compiled \(URL)")
   
//        AF.request(URL).responseDecodable(of: WeatherAPI.self) { response in
//                debugPrint(response)
//            }
        AF.request(URL).responseDecodable(of: WeatherAPI.self) { [self] response in
            
        
            if let latitude = response.value?.lat {
                self.latValue = latitude
                print("lat: \(latitude)")
            }

            if let longitude = response.value?.lon {
                self.lonValue = longitude
                print("lon: \(longitude)")
            }
            
            
            if let current_dt = response.value?.current.dt {
                self.current_dtValue = Int(current_dt)
                print("dt is: \(current_dt)")
            }
            
            if let temperature = response.value?.current.temp {
                self.current_tempValue = temperature
                print("current temp is \(temperature)")
            }
            
            
            if let description = response.value?.current.weather[0].weatherDescription {
                self.descriptionValue = description
                print("current weather is \(descriptionValue)" )
            }
            
            if let icon = response.value?.current.weather[0].icon {
                self.icon = icon
                print("icon today \(icon)")
            }
            
            //DAILY
            //sunrise tomorrow
            if let daily1_sunrise = response.value?.daily[1].daily_sunrise {
                self.daily1_sunriseValue = daily1_sunrise
                print("sunrise tomorrow\(daily1_sunriseValue)" )
            }
            
            //weather tomorrow
            if let daily1_description = response.value?.daily[1].daily_weather[0].weatherDescription{
                self.daily1_descriptionValue = daily1_description
                print(daily1_description)
                print("temp tomorrow \(daily1_description)" )
            }
            
            //temp tomorrow
            if let daily1_temp_day = response.value?.daily[1].daily_temp.day{
                
                self.daily1_tempValue_day = daily1_temp_day
                print(daily1_temp_day)
                print("temp tomorrow \(daily1_tempValue_day)" )
                
            }
            
            //icon tomorrow
            if let daily1_icon = response.value?.daily[1].daily_weather[0].icon {
                self.daily1_icon = daily1_icon
                print("icon tomorrow \(icon)")
            }


            
//
            
//            if let cityName = response.value?.name {
//                self.cityValue = cityName
//                print(cityName)
//            } else {
//                print("no city")
//            }
//


            
            


                    
    }

 }

}
