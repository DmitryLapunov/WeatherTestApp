//
//  Images.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation
import UIKit

enum Images {
    enum Custom {
        static let snowflake = UIImage(named: "fi_snowflake") ?? UIImage()
        static let background = UIImage(named: "background_image")
        static let sunset = UIImage(named: "fi_sunset")
        static let calendar = UIImage(named: "fi_calendar")
    }
    
    enum System {
        static let cloudImage = UIImage(systemName: "cloud.fill") ?? UIImage()
        static let snowflake = UIImage(systemName: "snowflake") ?? UIImage()
        static let sunset = UIImage(systemName: "sunset.fill") ?? UIImage()
    }
}
