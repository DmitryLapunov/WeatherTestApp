//
//  WeatherTypeEnum.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation
import UIKit

enum WeatherTypeEnum: String, CaseIterable {
    case clouds
    case snowfall
    
    var weatherIcon: UIImage {
        switch self {
        case .clouds:
            let cloudImage = Images.System.cloudImage
            let flipOrientation = (cloudImage.imageOrientation.rawValue + 4) % 8
            if let cgImage = cloudImage.cgImage, let orientation = UIImage.Orientation(rawValue: flipOrientation) {
                let flippedImage = UIImage(cgImage: cgImage,
                                           scale: cloudImage.scale,
                                           orientation: orientation)
                return flippedImage.withTintColor(Colors.Custom.basicWhite)
            } else {
                return cloudImage.withTintColor(Colors.Custom.basicWhite)
            }
        case .snowfall:
            if #available(iOS 15, *) {
                return Images.System.snowflake
            } else {
                return Images.Custom.snowflake
            }
        }
    }
}
