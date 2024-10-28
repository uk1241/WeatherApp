//
//  ModelClass.swift
//  Clima
//
//  Created by R Unnikrishnan on 26/10/24.
//
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let timezone: Int? 
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
