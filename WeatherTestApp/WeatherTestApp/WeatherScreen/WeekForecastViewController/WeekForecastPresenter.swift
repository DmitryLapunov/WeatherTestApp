//
//  WeekForecastPresenter.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol WeekForecastPresenterProtocol: AnyObject {
    func setupForecastData()
}

final class WeekForecastPresenter: WeekForecastPresenterProtocol {
    
    weak var view: WeekForecastViewProtocol?
    private let weatherStructure: WeatherStructure
    
    init(view: WeekForecastViewProtocol, weatherStructure: WeatherStructure) {
        self.view = view
        self.weatherStructure = weatherStructure
    }
    
    func setupForecastData() {
        let data = weatherStructure.forecast
        view?.presentData(data: data)
    }
}
