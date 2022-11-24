//
//  CityInfoStructure.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

struct CityInfoStructure {
    let city: String
    let temperature: String
    
    init(weather: WeatherStructure) {
        self.city = weather.city
        self.temperature = weather.temperature
    }
}
