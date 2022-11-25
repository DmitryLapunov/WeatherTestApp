//
//  Contents.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

enum Contents {
    enum Strings {
        static let currentTime = "Сейчас"
        static let sunset = "Заход солнца"
        static let jsonName = "TestTaskJSON"
        static let jsonType = "json"
        static let tenDayForecast = "10-дневный прогноз"
        static let probability = "70 %"
        static let today = "Сегодня"
    }
    
    enum Symbols {
        static let verticalSeparator = "\u{0020}|\u{0020}"
        static let degreeSymbol = "°"
    }
    
    enum Errors {
        static let jsonError = "An error occured while trying to access JSON file."
        static let parseError = "An error occured while trying to parse JSON data."
    }
}
