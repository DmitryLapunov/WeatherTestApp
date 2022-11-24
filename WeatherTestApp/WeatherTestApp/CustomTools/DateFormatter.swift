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
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd.MM.yyyy"
        let dateFormatterSet = DateFormatter()
        dateFormatterSet.dateFormat = "EE"
        let formattedDate = dateFormatterSet.string(from: dateFormatterGet.date(from: unformattedDate) ?? Date())
        return formattedDate
    }
}
