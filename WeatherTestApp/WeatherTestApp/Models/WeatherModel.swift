//
//  WeatherModel.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation

enum WeatherTypeEnum: String, Decodable {
    case clouds
    case snowfall
}

struct WeatherModel: Decodable {
    let city: String
    let temperature: String
    let description: String
    let weatherPerDay: [TodayWeatherModel]
    let forecast: [WeekdayWeatherModel]
    
    enum CodingKeys: String, CodingKey {
        case city
        case temperature
        case description
        case weatherPerDay = "weather_per_day"
        case forecast
    }
}

struct TodayWeatherModel: Decodable {
    let timestamp: Int
    let weatherType: WeatherTypeEnum
    let temperature: String
    var sunset: Bool?
    
    enum CodingKeys: String, CodingKey {
        case timestamp
        case weatherType = "weather_type"
        case temperature
        case sunset
    }
}

struct WeekdayWeatherModel: Decodable {
    let date: String
    let minTemperature: Int
    let maxTemperature: Int
    let weatherType: WeatherTypeEnum
    
    enum CodingKeys: String, CodingKey {
        case date
        case minTemperature = "min_temperature"
        case maxTemperature = "max_temperature"
        case weatherType = "weather_type"
    }
}
