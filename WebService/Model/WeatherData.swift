//
//  WeatherData.swift
//  WebService
//
//  Created by Giulio Ammendola on 21/04/2022.
//

//https://www.youtube.com/watch?v=dbM-Ew5HR6Y&t=0s

//import Foundation
//
//
//struct Forecast: Codable {
//    struct Daily: Codable {
//        let dt: Data
//        struct Temp: Codable {
//            let min: Double
//            let max: Double
//        }
//        
//        let temp: Temp
//        let humidity: Int
//        struct Weather: Codable {
//            let id: Int
//            let description: String
//            let icon: String
//            var weatherIconURL: URL {
//                let urlString = "http://openweathermap.org/img/wn/\(icon)@2x.png"
//                return URL(string: urlString)!
//            }
//        }
//        let weather: [Weather]
//        let clouds: Int
//        let pop: Double
//    }
//    
//    let daily: [Daily]
//    
//}
