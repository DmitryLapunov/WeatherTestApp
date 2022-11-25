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
        if let exactTemperature = weather.temperature.components(separatedBy: Contents.Symbols.verticalSeparator).first,
           let weatherDescription = weather.temperature.components(separatedBy: Contents.Symbols.verticalSeparator).last {
            self.temperature = String(format: "%@%@%@%@",
                                      exactTemperature,
                                      Contents.Symbols.degreeSymbol,
                                      Contents.Symbols.verticalSeparator,
                                      weatherDescription)
        } else {
            self.temperature = weather.temperature
        }
        self.description = weather.description
        self.weatherPerDay = weather.weatherPerDay.map({ TodayWeatherStructure(weather: $0) })
        self.forecast = weather.forecast.map({ WeekdayWeatherStructure(weather: $0) })
    }
}

struct TodayWeatherStructure {
    let timestamp: String
    let weatherType: WeatherTypeEnum
    let temperature: String
    let sunset: Bool
    
    init(weather: TodayWeatherModel) {
        self.timestamp = weather.timestamp
        self.weatherType = WeatherTypeEnum.allCases.randomElement() ?? WeatherTypeEnum.clouds
        self.temperature = weather.temperature + Contents.Symbols.degreeSymbol
        if let isSunset = weather.sunset {
            self.sunset = isSunset
        } else {
            self.sunset = false
        }
    }
}

struct WeekdayWeatherStructure {
    let date: String
    let minTemperature: String
    let maxTemperature: String
    let weatherType: WeatherTypeEnum
    
    init(weather: WeekdayWeatherModel) {
        self.date = weather.date
        self.minTemperature = String(weather.minTemperature) + Contents.Symbols.degreeSymbol
        self.maxTemperature = String(weather.maxTemperature) + Contents.Symbols.degreeSymbol
        self.weatherType = WeatherTypeEnum.allCases.randomElement() ?? WeatherTypeEnum.clouds
    }
}
