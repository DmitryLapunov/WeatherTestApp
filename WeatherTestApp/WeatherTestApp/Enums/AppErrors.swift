//
//  AppErrors.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation

enum AppErrors: Error {
    case jsonError
    case parseError
    
    var localizedDescription: String {
        switch self {
        case .jsonError:
            return "An error occured while trying to access JSON file."
        case .parseError:
            return "An error occured while trying to parse JSON data."
        }
    }
}
