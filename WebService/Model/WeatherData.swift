//
//  WeatherData.swift
//  WebService
//
//  Created by Giulio Ammendola on 21/04/2022.
//

import Foundation

class OpenWeather: ObservableObject {

//    @Published var cityID = 2643743
//    @Published var key = "cbbf654a1956664b0c183ba26f389799"

//    @Published var weatherRequest = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.latitude)lon=\(location.longitude)&appid=cbbf654a1956664b0c183ba26f389799&units=metric"

    @Published var weatherRequest = "https://api.openweathermap.org/data/2.5/weather?lat=51.5085&lon=-0.1257&appid=cbbf654a1956664b0c183ba26f389799&units=metric"
}


struct WeatherAPI: Decodable {
    
    let name: String
    let coord: CoordDetail
    let weather: [Weather]
    let main: MainDetail
}

struct CoordDetail: Decodable {
    
    let lat: Double
    let lon: Double
    
    private enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lon = "lon"
    }
}

struct MainDetail: Decodable {
    
    let temp: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp = "temp"
    }
}

struct Weather: Decodable {
    let id: Int
    var main: String
    var weatherDescription: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon
    }
}
