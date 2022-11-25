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
            let cloudImage = UIImage(systemName: "cloud.fill") ?? UIImage()
            let flipOrientation = (cloudImage.imageOrientation.rawValue + 4) % 8
            if let cgImage = cloudImage.cgImage, let orientation = UIImage.Orientation(rawValue: flipOrientation) {
                let flippedImage = UIImage(cgImage: cgImage,
                                           scale: cloudImage.scale,
                                           orientation: orientation)
                return flippedImage
            } else {
                return cloudImage
            }
        case .snowfall:
            return UIImage(systemName: "snowflake") ?? UIImage()
        }
    }
}
