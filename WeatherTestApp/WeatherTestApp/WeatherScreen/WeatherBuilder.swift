//
//  WeatherBuilder.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

final class WeatherBuilder {
    func build() -> WeatherViewController {
        let view = WeatherViewController()
        let presenter = WeatherPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
