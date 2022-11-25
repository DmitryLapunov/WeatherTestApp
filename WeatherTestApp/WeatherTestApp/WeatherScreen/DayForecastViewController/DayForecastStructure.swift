//
//  DayForecastStructure.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

struct DayForecastStructure {
    let description: String
    let weatherPerDay: [TodayWeatherStructure]
    
    init(weather: WeatherStructure) {
        self.description = weather.description
        self.weatherPerDay = weather.weatherPerDay
    }
}
