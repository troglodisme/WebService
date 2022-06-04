//
//  WeatherManager.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.


import Foundation
import CoreLocation
import Alamofire

class WeatherManager: ObservableObject {
    
    //current
    @Published var cityValue = ""
    @Published var latValue = 0.0
    @Published var lonValue = 0.0
    @Published var mainValue = ""
    @Published var descriptionValue = ""
    @Published var icon = ""
    @Published var current_dtValue = Date()
    @Published var current_tempValue = 0.0

    //daily #1
    @Published var dailyId_1 = 0
    @Published var daily_dtVal_1 = ""
    @Published var daily_descriptionVal_1 = ""
    @Published var daily_tempVal_1 = 0.0
    @Published var daily_icon_1 = ""
    @Published var daily_tempMin_1 = 0.0
    @Published var daily_tempMax_1 = 0.0
    @Published var daily_pop_1 = 0.0

    //daily #2
    @Published var dailyId_2 = 0
    @Published var daily_dtVal_2 = ""
    @Published var daily_descriptionVal_2 = ""
    @Published var daily_tempVal_2 = 0.0
    @Published var daily_icon_2 = ""
    @Published var daily_tempMin_2 = 0.0
    @Published var daily_tempMax_2 = 0.0
    @Published var daily_pop_2 = 0.0
    
    //daily #3
    @Published var dailyId_3 = 0
    @Published var daily_dtVal_3 = ""
    @Published var daily_descriptionVal_3 = ""
    @Published var daily_tempVal_3 = 0.0
    @Published var daily_icon_3 = ""
    @Published var daily_tempMin_3 = 0.0
    @Published var daily_tempMax_3 = 0.0
    @Published var daily_pop_3 = 0.0
    
    //daily #4
    @Published var dailyId_4 = 0
    @Published var daily_dtVal_4 = ""
    @Published var daily_descriptionVal_4 = ""
    @Published var daily_tempVal_4 = 0.0
    @Published var daily_icon_4 = ""
    @Published var daily_tempMin_4 = 0.0
    @Published var daily_tempMax_4 = 0.0
    @Published var daily_pop_4 = 0.0

        
    func getWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        print("current lat \(latitude)")
        print("current long \(longitude)")
        
        let KEY = "cbbf654a1956664b0c183ba26f389799"
        

//one call api
        let URL = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&appid=\(KEY)&units=metric"
                
        print("Compiled URL: \(URL)")
   
        AF.request(URL).responseDecodable(of: WeatherAPI.self) { [self] response in
        
            
            //CURRENT RESPONSE
            
            if let latitude = response.value?.lat {
                self.latValue = latitude
            }

            if let longitude = response.value?.lon {
                self.lonValue = longitude
            }
                        
            if let current_dt = response.value?.current.dt {
                                
                let current_date = Date(timeIntervalSince1970: current_dt);
                self.current_dtValue = current_date
                
            }
            
            if let temperature = response.value?.current.temp {
                self.current_tempValue = temperature
            }
                        
            if let description = response.value?.current.weather[0].weatherDescription {
                self.descriptionValue = description
            }
            
            //could probably just use the weather condition or ID instead of pulling the icon for the next refactor
            if let icon = response.value?.current.weather[0].icon {
                
                if icon == "01d" { self.icon = "sun.max.fill" }
                if icon == "01n" { self.icon = "moon.stars.fill" }
                if icon == "02d" { self.icon = "cloud.sun.fill" }
                if icon == "02n" { self.icon = "cloud.moon.fill" }
                if icon == "03d" { self.icon = "cloud.fill" }
                if icon == "03n" { self.icon = "cloud.fill" }
                if icon == "04d" { self.icon = "cloud.fill" }
                if icon == "04n" { self.icon = "cloud.fill" }
                if icon == "09d" { self.icon = "cloud.rain.fill" }
                if icon == "09n" { self.icon = "cloud.rain.fill" }
                if icon == "10d" { self.icon = "cloud.sun.rain.fill" }
                if icon == "10n" { self.icon = "cloud.moon.rain.fill" }
                if icon == "11d" { self.icon = "cloud.bolt.fill" }
                if icon == "11n" { self.icon = "cloud.bolt.fill" }
                if icon == "13d" { self.icon = "cloud.snow.fill" }
                if icon == "13n" { self.icon = "cloud.snow.fill" }
                if icon == "50d" { self.icon = "cloud.fog.fill" }
                if icon == "50n" { self.icon = "cloud.fog.fill" }
            }
            
            
            //DAILY RESPONSE  #1
            //Should create a for loop to iterate over the next 4 days?
            
            if let dailyId_1 = response.value?.daily[1].daily_weather[0].id {
                self.dailyId_1 = dailyId_1
            }
                
            if let dailyDt_1 = response.value?.daily[1].daily_dt {
                                
                let daily1_dt = Date(timeIntervalSince1970: dailyDt_1);
                self.daily_dtVal_1 = daily1_dt.formatted(.dateTime.weekday(.abbreviated))
                
            }
                                
                        
            //Weather description daily 1
            if let dailyDescription_1  = response.value?.daily[1].daily_weather[0].weatherDescription {
                self.daily_descriptionVal_1 = dailyDescription_1
                
            }
            
            //icon tomorrow
            if let dailyIcon_1 = response.value?.daily[1].daily_weather[0].icon {
                
                
                if dailyIcon_1 == "01d" { self.daily_icon_1 = "sun.max.fill" }
                if dailyIcon_1 == "01n" { self.daily_icon_1 = "moon.stars.fill" }
                if dailyIcon_1 == "02d" { self.daily_icon_1 = "cloud.sun.fill" }
                if dailyIcon_1 == "02n" { self.daily_icon_1 = "cloud.moon.fill" }
                if dailyIcon_1 == "03d" { self.daily_icon_1 = "cloud.fill" }
                if dailyIcon_1 == "03n" { self.daily_icon_1 = "cloud.fill" }
                if dailyIcon_1 == "04d" { self.daily_icon_1 = "cloud.fill" }
                if dailyIcon_1 == "04n" { self.daily_icon_1 = "cloud.fill" }
                if dailyIcon_1 == "09d" { self.daily_icon_1 = "cloud.rain.fill" }
                if dailyIcon_1 == "09n" { self.daily_icon_1 = "cloud.rain.fill" }
                if dailyIcon_1 == "10d" { self.daily_icon_1 = "cloud.sun.rain.fill" }
                if dailyIcon_1 == "10n" { self.daily_icon_1 = "cloud.moon.rain.fill" }
                if dailyIcon_1 == "11d" { self.daily_icon_1 = "cloud.bolt.fill" }
                if dailyIcon_1 == "11n" { self.daily_icon_1 = "cloud.bolt.fill" }
                if dailyIcon_1 == "13d" { self.daily_icon_1 = "cloud.snow.fill" }
                if dailyIcon_1 == "13n" { self.daily_icon_1 = "cloud.snow.fill" }
                if dailyIcon_1 == "50d" { self.daily_icon_1 = "cloud.fog.fill" }
                if dailyIcon_1 == "50n" { self.daily_icon_1 = "cloud.fog.fill" }
                            
            }
            
                     
            if let dailyTempMin_1 = response.value?.daily[1].daily_temp.min {
                self.daily_tempMin_1 = dailyTempMin_1
            }
            
            if let dailyTempMax_1 = response.value?.daily[1].daily_temp.max {
                self.daily_tempMax_1 = dailyTempMax_1
            }
            
            if let daily_pop_1 = response.value?.daily[1].daily_pop {
                self.daily_pop_1 = daily_pop_1
            }
            
            
            //DAILY RESPONSE  #2
            //Should create a for loop to iterate over the next 4 days?
            
            if let dailyDt_2 = response.value?.daily[2].daily_dt {
                                
                let daily2_dt = Date(timeIntervalSince1970: dailyDt_2);
                self.daily_dtVal_2 = daily2_dt.formatted(.dateTime.weekday(.abbreviated))
                
            }
                        
            //Weather description daily 2
            if let dailyDescription_2  = response.value?.daily[2].daily_weather[0].weatherDescription {
                self.daily_descriptionVal_2 = dailyDescription_2
                
//                print("temp tomorrow \(daily1_description)" )
            }
            
            //icon tomorrow
            if let dailyIcon_2 = response.value?.daily[2].daily_weather[0].icon {
                
                
                if dailyIcon_2 == "01d" { self.daily_icon_2 = "sun.max.fill" }
                if dailyIcon_2 == "01n" { self.daily_icon_2 = "moon.stars.fill" }
                if dailyIcon_2 == "02d" { self.daily_icon_2 = "cloud.sun.fill" }
                if dailyIcon_2 == "02n" { self.daily_icon_2 = "cloud.moon.fill" }
                if dailyIcon_2 == "03d" { self.daily_icon_2 = "cloud.fill" }
                if dailyIcon_2 == "03n" { self.daily_icon_2 = "cloud.fill" }
                if dailyIcon_2 == "04d" { self.daily_icon_2 = "cloud.fill" }
                if dailyIcon_2 == "04n" { self.daily_icon_2 = "cloud.fill" }
                if dailyIcon_2 == "09d" { self.daily_icon_2 = "cloud.rain.fill" }
                if dailyIcon_2 == "09n" { self.daily_icon_2 = "cloud.rain.fill" }
                if dailyIcon_2 == "10d" { self.daily_icon_2 = "cloud.sun.rain.fill" }
                if dailyIcon_2 == "10n" { self.daily_icon_2 = "cloud.moon.rain.fill" }
                if dailyIcon_2 == "11d" { self.daily_icon_2 = "cloud.bolt.fill" }
                if dailyIcon_2 == "11n" { self.daily_icon_2 = "cloud.bolt.fill" }
                if dailyIcon_2 == "13d" { self.daily_icon_2 = "cloud.snow.fill" }
                if dailyIcon_2 == "13n" { self.daily_icon_2 = "cloud.snow.fill" }
                if dailyIcon_2 == "50d" { self.daily_icon_2 = "cloud.fog.fill" }
                if dailyIcon_2 == "50n" { self.daily_icon_2 = "cloud.fog.fill" }
                            
            }
            
                     
            if let dailyTempMin_2 = response.value?.daily[2].daily_temp.min {
                self.daily_tempMin_2 = dailyTempMin_2
            }
            
            if let dailyTempMax_2 = response.value?.daily[2].daily_temp.max {
                self.daily_tempMax_2 = dailyTempMax_2
            }
            
            if let daily_pop_2 = response.value?.daily[2].daily_pop {
                self.daily_pop_2 = daily_pop_2
            }
            
            
            
            //DAILY RESPONSE  #3
            //Should create a for loop to iterate over the next 4 days?
            
            if let dailyDt_3 = response.value?.daily[3].daily_dt {
                                
                let daily3_dt = Date(timeIntervalSince1970: dailyDt_3);
                self.daily_dtVal_3 = daily3_dt.formatted(.dateTime.weekday(.abbreviated))
                
            }
                        
            //Weather description daily 3
            if let dailyDescription_3  = response.value?.daily[3].daily_weather[0].weatherDescription {
                self.daily_descriptionVal_3 = dailyDescription_3
                
            }
            
            //icon tomorrow
            if let dailyIcon_3 = response.value?.daily[3].daily_weather[0].icon {
                                
                if dailyIcon_3 == "01d" { self.daily_icon_3 = "sun.max.fill" }
                if dailyIcon_3 == "01n" { self.daily_icon_3 = "moon.stars.fill" }
                if dailyIcon_3 == "02d" { self.daily_icon_3 = "cloud.sun.fill" }
                if dailyIcon_3 == "02n" { self.daily_icon_3 = "cloud.moon.fill" }
                if dailyIcon_3 == "03d" { self.daily_icon_3 = "cloud.fill" }
                if dailyIcon_3 == "03n" { self.daily_icon_3 = "cloud.fill" }
                if dailyIcon_3 == "04d" { self.daily_icon_3 = "cloud.fill" }
                if dailyIcon_3 == "04n" { self.daily_icon_3 = "cloud.fill" }
                if dailyIcon_3 == "09d" { self.daily_icon_3 = "cloud.rain.fill" }
                if dailyIcon_3 == "09n" { self.daily_icon_3 = "cloud.rain.fill" }
                if dailyIcon_3 == "10d" { self.daily_icon_3 = "cloud.sun.rain.fill" }
                if dailyIcon_3 == "10n" { self.daily_icon_3 = "cloud.moon.rain.fill" }
                if dailyIcon_3 == "11d" { self.daily_icon_3 = "cloud.bolt.fill" }
                if dailyIcon_3 == "11n" { self.daily_icon_3 = "cloud.bolt.fill" }
                if dailyIcon_3 == "13d" { self.daily_icon_3 = "cloud.snow.fill" }
                if dailyIcon_3 == "13n" { self.daily_icon_3 = "cloud.snow.fill" }
                if dailyIcon_3 == "50d" { self.daily_icon_3 = "cloud.fog.fill" }
                if dailyIcon_3 == "50n" { self.daily_icon_3 = "cloud.fog.fill" }
                            
            }
            
                     
            if let dailyTempMin_3 = response.value?.daily[2].daily_temp.min {
                self.daily_tempMin_3 = dailyTempMin_3
            }
            
            if let dailyTempMax_3 = response.value?.daily[2].daily_temp.max {
                self.daily_tempMax_3 = dailyTempMax_3
            }
            
            if let daily_pop_3 = response.value?.daily[2].daily_pop {
                self.daily_pop_3 = daily_pop_3
            }
            
            
            
            
            //DAILY RESPONSE  #4
            //Should create a for loop to iterate over the next 4 days?
            
            if let dailyDt_4 = response.value?.daily[4].daily_dt {
                                
                let daily4_dt = Date(timeIntervalSince1970: dailyDt_4);
                self.daily_dtVal_4 = daily4_dt.formatted(.dateTime.weekday(.abbreviated))
                
            }
                        
            //Weather description daily 4
            if let dailyDescription_4  = response.value?.daily[3].daily_weather[0].weatherDescription {
                self.daily_descriptionVal_4 = dailyDescription_4
                
            }
            
            //icon tomorrow
            if let dailyIcon_4 = response.value?.daily[3].daily_weather[0].icon {
                                
                if dailyIcon_4 == "01d" { self.daily_icon_4 = "sun.max.fill" }
                if dailyIcon_4 == "01n" { self.daily_icon_4 = "moon.stars.fill" }
                if dailyIcon_4 == "02d" { self.daily_icon_4 = "cloud.sun.fill" }
                if dailyIcon_4 == "02n" { self.daily_icon_4 = "cloud.moon.fill" }
                if dailyIcon_4 == "03d" { self.daily_icon_4 = "cloud.fill" }
                if dailyIcon_4 == "03n" { self.daily_icon_4 = "cloud.fill" }
                if dailyIcon_4 == "04d" { self.daily_icon_4 = "cloud.fill" }
                if dailyIcon_4 == "04n" { self.daily_icon_4 = "cloud.fill" }
                if dailyIcon_4 == "09d" { self.daily_icon_4 = "cloud.rain.fill" }
                if dailyIcon_4 == "09n" { self.daily_icon_4 = "cloud.rain.fill" }
                if dailyIcon_4 == "10d" { self.daily_icon_4 = "cloud.sun.rain.fill" }
                if dailyIcon_4 == "10n" { self.daily_icon_4 = "cloud.moon.rain.fill" }
                if dailyIcon_4 == "11d" { self.daily_icon_4 = "cloud.bolt.fill" }
                if dailyIcon_4 == "11n" { self.daily_icon_4 = "cloud.bolt.fill" }
                if dailyIcon_4 == "13d" { self.daily_icon_4 = "cloud.snow.fill" }
                if dailyIcon_4 == "13n" { self.daily_icon_4 = "cloud.snow.fill" }
                if dailyIcon_4 == "50d" { self.daily_icon_4 = "cloud.fog.fill" }
                if dailyIcon_4 == "50n" { self.daily_icon_4 = "cloud.fog.fill" }
                            
            }
            
                     
            if let dailyTempMin_4 = response.value?.daily[3].daily_temp.min {
                self.daily_tempMin_4 = dailyTempMin_4
            }
            
            if let dailyTempMax_4 = response.value?.daily[3].daily_temp.max {
                self.daily_tempMax_4 = dailyTempMax_4
            }
            
            if let daily_pop_4 = response.value?.daily[3].daily_pop {
                self.daily_pop_4 = daily_pop_4
            }
            
    }

 }

}
