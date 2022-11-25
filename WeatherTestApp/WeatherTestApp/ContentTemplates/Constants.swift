//
//  Constants.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation
import UIKit

enum Constants {
    enum BasicConstraints {
        static let largeLeading: CGFloat = 24
        static let largeTrailing: CGFloat = -24
        static let mediumLeading: CGFloat = 14
        static let mediumTrailing: CGFloat = -14
        static let mediumTop: CGFloat = 14
        static let mediumBottom: CGFloat = -14
        static let zero: CGFloat = 0
        static let largeWeatherIcon: CGFloat = 28
        static let mediumWeatherIcon: CGFloat = 20
        static let smallWeatherIcon: CGFloat = 14
        static let largeCornerRadius: CGFloat = 14
    }
    
    enum Insets {
        static let zero: CGFloat = 0
        static let medium: CGFloat = 14
    }
    
    enum CustomConstraints {
        static let cityInfoChildHeight: CGFloat = 126
        static let weekForecastChildHeight: CGFloat = 466
        static let cityLabelTop: CGFloat = 16
        static let weatherLabelTop: CGFloat = 6
        static let bottomLabelTop: CGFloat = 10
        static let forecastLabelLeading: CGFloat = 37
        static let calendarImageViewLeading: CGFloat = 16
        static let tableViewBottom: CGFloat = -21
        static let weatherStackTrailing: CGFloat = -(UIScreen.main.bounds.width / 2.5)
        static let weatherStackWidth: CGFloat = 30
        static let minTemperatureTrailing: CGFloat = -(UIScreen.main.bounds.width / 5)
    }
    
    enum Label {
        static let singleLine = 1
        static let infiniteLines = 0
    }
    
    enum Spacing {
        static let collectionView: CGFloat = 14
        static let childControllers: CGFloat = 9
        static let weatherStack: CGFloat = 3
    }
    
    enum CellSize {
        static let fixedCellWidth = 43
        static let collectionViewHeight: CGFloat = 90
        static let tableViewRow: CGFloat = 49
    }
}
