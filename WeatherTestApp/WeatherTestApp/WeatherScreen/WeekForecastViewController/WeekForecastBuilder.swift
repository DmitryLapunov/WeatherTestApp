//
//  WeekForecastBuilder.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

final class WeekForecastBuilder {
    func build(weatherStructure: WeatherStructure) -> WeekForecastViewController {
        let view = WeekForecastViewController()
        let presenter = WeekForecastPresenter(view: view,
                                              weatherStructure: weatherStructure)
        view.presenter = presenter
        return view
    }
}
