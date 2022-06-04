//
//  WeatherData.swift
//  WebService
//
//  Created by Giulio Ammendola on 21/04/2022.
//

import Foundation

struct WeatherAPI: Decodable {
    
    let lat: Double  //latitude
    let lon: Double  //longitude
    let current: currentDetail
    let daily: [Daily]
}

struct currentDetail: Decodable {

    let dt: Double
    let temp: Double
    let weather: [Weather]

    private enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case temp = "temp"
        case weather = "weather"
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
        case icon = "icon"
    }
}


struct Daily: Decodable {

    let daily_dt: Double
    let daily_temp: tempDetail
    let daily_weather: [Weather] //same model as current
    let daily_pop: Double

    private enum CodingKeys: String, CodingKey {
        case daily_dt = "dt"
        case daily_temp = "temp"
        case daily_weather = "weather"
        case daily_pop = "pop"
    }
}

struct tempDetail: Decodable {

    let day: Double
    let min: Double
    let max: Double

    private enum CodingKeys: String, CodingKey {
        case day = "day"
        case min = "min"
        case max = "max"
    }
}
