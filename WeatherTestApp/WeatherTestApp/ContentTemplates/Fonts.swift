//
//  Fonts.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation
import UIKit

enum Fonts {
    enum Custom {
        static let cityName = UIFont(name: InterFont.medium, size: 30)
        static let cityWeather = UIFont(name: InterFont.medium, size: 16)
        static let weatherDescription = UIFont(name: InterFont.medium, size: 14)
        static let timestamp = UIFont(name: InterFont.medium, size: 14)
        static let timestampTemperature = UIFont(name: InterFont.medium, size: 16)
        static let timestampSunset = UIFont(name: InterFont.medium, size: 18)
        static let weekForecast = UIFont(name: InterFont.medium, size: 14)
        static let weekday = UIFont(name: InterFont.medium, size: 18)
        static let probability = UIFont(name: InterFont.medium, size: 11)
        static let dayTemperature = UIFont(name: InterFont.medium, size: 16)
    }
}
