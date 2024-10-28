//
//  WeatherModel.swift
//  Clima
//
//  Created by R Unnikrishnan on 28/10/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel
{
    let conditionID:Int
    let cityName:String
    let temperature:Double
    
    var conditionName : String
    {
        switch conditionID
        {
        case 200...232:
            return "Thunderstorm"
        case 300...321:
            return "Drizzle"
        case 500...531:
            return "Rain"
        case 600...622:
            return "Snow"
        case 700...781:
            return "Atmospheric"
        case 800...801:
            return "Clear"
        case 802...803:
            return "Clouds"
        default:
            return "Clouds"
        }
    }
    
    var temperartureString:String
    {
        return String(format: "%1f", temperature)
    }
    
}
