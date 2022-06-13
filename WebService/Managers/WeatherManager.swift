//
//  WeatherManager.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.


import Foundation
import CoreLocation
import Alamofire

class WeatherModel: ObservableObject {
    
    @Published var dailyId = 0
    @Published var daily_dt = ""
    @Published var daily_description = ""
    @Published var daily_temp = 0.0
    @Published var daily_icon = ""
    @Published var daily_tempMin = 0.0
    @Published var daily_tempMax = 0.0
    @Published var daily_pop = 0.0
}

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
    
    @Published var dailyArray = [WeatherModel(),
                                 WeatherModel(),
                                 WeatherModel(),
                                 WeatherModel(),
                                 WeatherModel(),
                                 WeatherModel(),
                                 WeatherModel()

                                ]
    
    // se sappiamo gia' quante volte il modello verra' usato
        
    //    @Published var dailyArray: [WeatherModel()]?
    //    Per usare questo va aggiunto init, usando un array dinamico
        
    //    oppure con un dizionario
    
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
            
            
            //DAILY LOOP
            
            let days = 0...6 //skipping 0 as that's current day
            
            for day in days {
                
                print("DAY # \(day)")
                
                if let dailyId = response.value?.daily[day].daily_weather[0].id {
                    dailyArray[day].dailyId = dailyId
                    print("Day-\(day), id: \(dailyId)")
                }
                
                if let dailyDt = response.value?.daily[day].daily_dt {
                    
                    let dailyDt = Date(timeIntervalSince1970: dailyDt);
                    dailyArray[day].daily_dt = dailyDt.formatted(.dateTime.weekday(.abbreviated))
                    print("Day-\(day), date: \(dailyDt)")
                }
                
                if let dailyDescription  = response.value?.daily[day].daily_weather[0].weatherDescription {
                    dailyArray[day].daily_description = dailyDescription
                    print("Day-\(day), description: \(dailyDescription)")
                }
                
                if let dailyTempMin = response.value?.daily[day].daily_temp.min {
                    dailyArray[day].daily_tempMin = dailyTempMin
                    print("Day-\(day), temp min: \(dailyTempMin)")
                }
                
                if let dailyTempMax = response.value?.daily[day].daily_temp.max {
                    
                    dailyArray[day].daily_tempMax = dailyTempMax
                    print("Day-\(day), temp max: \(dailyTempMax)")
                }
                
                
                if let daily_pop = response.value?.daily[day].daily_pop {
                    dailyArray[day].daily_pop = daily_pop
                    print("Day-\(day), precipitation: \(daily_pop) %")
                }
                
                if let dailyIcon = response.value?.daily[day].daily_weather[0].icon {
                    
                    switch dailyIcon {
                        case "01d":
                            dailyArray[day].daily_icon = "sun.max.fill"
                            
                        case "01n": dailyArray[day].daily_icon = "moon.stars.fill"
                        case "02d": dailyArray[day].daily_icon = "cloud.sun.fill"
                        case "02n": dailyArray[day].daily_icon = "cloud.moon.fill"
                        case "03d": dailyArray[day].daily_icon = "cloud.fill"
                        case "03n": dailyArray[day].daily_icon = "cloud.fill"
                        case "04d": dailyArray[day].daily_icon = "cloud.fill"
                        case "04n": dailyArray[day].daily_icon = "cloud.fill"
                        case "09d": dailyArray[day].daily_icon = "cloud.rain.fill"
                        case "09n": dailyArray[day].daily_icon = "cloud.rain.fill"
                        case "10d": dailyArray[day].daily_icon = "cloud.sun.rain.fill"
                        case "10n": dailyArray[day].daily_icon = "cloud.moon.rain.fill"
                        case "11d": dailyArray[day].daily_icon = "cloud.bolt.fill"
                        case "11n": dailyArray[day].daily_icon = "cloud.bolt.fill"
                        case "13d": dailyArray[day].daily_icon = "cloud.snow.fill"
                        case "13n": dailyArray[day].daily_icon = "cloud.snow.fill"
                        case "50d": dailyArray[day].daily_icon = "cloud.fog.fill"
                        case "50n": dailyArray[day].daily_icon = "cloud.fog.fill"
                                                    
                        default:
                            dailyArray[day].daily_icon = "star.fill"
                    }                                            
                }
                
            }
            //end of for loop
            
            
        }
        
    }
    
}
