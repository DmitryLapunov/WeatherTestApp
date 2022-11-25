//
//  WeekForecastViewController+Extension.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol WeekForecastViewProtocol: AnyObject {
    func presentData(data: [WeekdayWeatherStructure])
}

extension WeekForecastViewController: WeekForecastViewProtocol {
    func presentData(data: [WeekdayWeatherStructure]) {
        self.weekdayWeatherArray = data
        controllerView.tableView.reloadData()
    }
}
