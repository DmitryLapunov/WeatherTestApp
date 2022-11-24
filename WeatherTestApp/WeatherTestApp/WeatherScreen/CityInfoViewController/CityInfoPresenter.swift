//
//  CityInfoPresenter.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol CityInfoPresenterProtocol: AnyObject {
    func setupWeatherData()
}

final class CityInfoPresenter: CityInfoPresenterProtocol {
    
    weak var view: CityInfoViewProtocol?
    private let weatherStructure: WeatherStructure
    
    init(view: CityInfoViewProtocol, weatherStructure: WeatherStructure) {
        self.view = view
        self.weatherStructure = weatherStructure
    }
    
    func setupWeatherData() {
        let data = CityInfoStructure(weather: weatherStructure)
        view?.presentData(data: data)
    }
}
