//
//  DayForecastBuilder.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

final class DayForecastBuilder {
    func build(weatherStructure: WeatherStructure) -> DayForecastViewController {
        let view = DayForecastViewController()
        let presenter = DayForecastPresenter(view: view,
                                             weatherStructure: weatherStructure)
        view.presenter = presenter
        return view
    }
}
