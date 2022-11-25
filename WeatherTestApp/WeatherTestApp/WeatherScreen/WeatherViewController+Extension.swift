//
//  WeatherViewController+Extension.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol WeatherViewProtocol: AnyObject {
    func configureControllers(data: WeatherStructure)
}

extension WeatherViewController: WeatherViewProtocol {
    func configureControllers(data: WeatherStructure) {
        let cityInfoChildBuilder = CityInfoBuilder()
        let cityInfoChild = cityInfoChildBuilder.build(weatherStructure: data)
        controllerView.addView(view: cityInfoChild.view, height: 126)
        self.addChild(cityInfoChild)
        cityInfoChild.didMove(toParent: self)
    }
}
