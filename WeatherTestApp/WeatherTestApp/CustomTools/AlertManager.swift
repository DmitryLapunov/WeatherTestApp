//
//  AlertManager.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation
import UIKit

final class AlertManager {
    static func createAlert(message: String) {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(defaultAction)
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController?.present(alertController, animated: true)
    }
}
