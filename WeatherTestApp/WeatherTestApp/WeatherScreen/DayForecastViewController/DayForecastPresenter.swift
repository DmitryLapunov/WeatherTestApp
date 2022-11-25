//
//  DayForecastPresenter.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol DayForecastPresenterProtocol: AnyObject {
    func setupForecastData()
}

final class DayForecastPresenter: DayForecastPresenterProtocol {
    
    weak var view: DayForecastViewProtocol?
    private let weatherStructure: WeatherStructure
    
    init(view: DayForecastViewProtocol, weatherStructure: WeatherStructure) {
        self.view = view
        self.weatherStructure = weatherStructure
    }
    
    func setupForecastData() {
        let data = DayForecastStructure(weather: weatherStructure)
        view?.presentForecasrData(data: data)
    }
}
