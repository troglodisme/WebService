//
//  AirQualityData.swift
//  WebService
//
//  Created by Giulio Ammendola on 04/06/2022.
//

import Foundation

struct AirQuality: Decodable {
    let list: [List]
}

struct List: Decodable {
    let main: Main
    let components: Components
}

struct Main: Decodable {
    let aqi: Int
}

struct Components: Decodable {
    let co: Double
    let no2: Double
}
