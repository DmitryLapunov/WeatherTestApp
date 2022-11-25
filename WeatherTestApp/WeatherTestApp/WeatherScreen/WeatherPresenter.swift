//
//  WeatherPresenter.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol WeatherPresenterProtocol: AnyObject {
    func presentViews()
}

final class WeatherPresenter: WeatherPresenterProtocol {
    
    weak var view: WeatherViewProtocol?
    private let repository: WeatherRepositoryProtocol
    
    init(view: WeatherViewProtocol, repository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.view = view
        self.repository = repository
    }
    
    func presentViews() {
        repository.fetchWeather { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherStructure):
                self.view?.configureControllers(data: weatherStructure)
            case .failure(let error):
                AlertManager.createAlert(message: error.localizedDescription)
            }
        }
    }
}
