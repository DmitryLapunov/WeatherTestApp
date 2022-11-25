//
//  DayForecastViewController+Extension.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol DayForecastViewProtocol: AnyObject {
    func presentForecasrData(data: DayForecastStructure)
}

extension DayForecastViewController: DayForecastViewProtocol {
    func presentForecasrData(data: DayForecastStructure) {
        controllerView.setupView(data)
        controllerView.setNeedsDisplay()
        self.weatherPerDay = data.weatherPerDay
        controllerView.collectionView.reloadData()
    }
}
