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
            return Contents.Errors.jsonError
        case .parseError:
            return Contents.Errors.parseError
        }
    }
}
