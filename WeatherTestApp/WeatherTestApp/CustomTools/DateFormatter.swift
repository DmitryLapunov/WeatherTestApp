//
//  DateFormatter.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation
import UIKit

final class CustomDateFormatter {
    static func shortWeekdayFromDate(unformattedDate: String) -> String {
        let dateFormatterSet = DateFormatter()
        dateFormatterSet.dateFormat = "EE"
        let formattedDate = dateFormatterSet.string(from: getDateFromString(unformattedDate: unformattedDate))
        return formattedDate
    }
    
    static func getDateFromString(unformattedDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let formattedDate = dateFormatter.date(from: unformattedDate) ?? Date()
        return formattedDate
    }
}
