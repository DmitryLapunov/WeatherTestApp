//
//  WeatherStructure.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation

struct WeatherStructure {
    let city: String
    let temperature: String
    let description: String
    let weatherPerDay: [TodayWeatherStructure]
    let forecast: [WeekdayWeatherStructure]
    
    init(weather: WeatherModel) {
        self.city = weather.city
        self.temperature = weather.temperature
        self.description = weather.description
        self.weatherPerDay = weather.weatherPerDay.map({ TodayWeatherStructure(weather: $0) })
        self.forecast = weather.forecast.map({ WeekdayWeatherStructure(weather: $0) })
    }
}

struct TodayWeatherStructure {
    let timestamp: Int
    let weatherType: WeatherTypeEnum
    let temperature: String
    let sunset: Bool
    
    init(weather: TodayWeatherModel) {
        self.timestamp = weather.timestamp
        self.weatherType = weather.weatherType
        self.temperature = weather.temperature
        if let isSunset = weather.sunset {
            self.sunset = isSunset
        } else {
            self.sunset = false
        }
    }
}

struct WeekdayWeatherStructure {
    let date: String
    let minTemperature: Int
    let maxTemperature: Int
    let weatherType: WeatherTypeEnum
    
    init(weather: WeekdayWeatherModel) {
        self.date = weather.date
        self.minTemperature = weather.minTemperature
        self.maxTemperature = weather.maxTemperature
        self.weatherType = weather.weatherType
    }
}
