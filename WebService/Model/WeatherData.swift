////
////  WeatherData.swift
////  WebService
////
////  Created by Giulio Ammendola on 21/04/2022.
////
//
//import Foundation
//
//
//struct WeatherAPI: Decodable {
//    
//    let name: String //city name created from lat + long
//    let coord: CoordDetail
//    let weather: [Weather]
//    let main: MainDetail
//}
//
//struct CoordDetail: Decodable {
//    
//    let lat: Double
//    let lon: Double
//    
//    private enum CodingKeys: String, CodingKey {
//        case lat = "lat"
//        case lon = "lon"
//    }
//}
//
//struct MainDetail: Decodable {
//    
//    let temp: Double
//    
//    private enum CodingKeys: String, CodingKey {
//        case temp = "temp"
//    }
//}
//
//struct Weather: Decodable {
//    let id: Int
//    var main: String
//    var weatherDescription: String
//    var icon: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case main = "main"
//        case weatherDescription = "description"
//        case icon = "icon"
//    }
//}
