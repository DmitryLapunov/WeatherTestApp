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
        controllerView.addView(view: cityInfoChild.view,
                               height: Constants.CustomConstraints.cityInfoChildHeight)
        self.addChild(cityInfoChild)
        cityInfoChild.didMove(toParent: self)
        
        let dayForecastChildBuilder = DayForecastBuilder()
        let dayForecastChild = dayForecastChildBuilder.build(weatherStructure: data)
        controllerView.addView(view: dayForecastChild.view)
        self.addChild(dayForecastChild)
        dayForecastChild.didMove(toParent: self)
        
        let weekForecastChildBuilder = WeekForecastBuilder()
        let weekForecastChild = weekForecastChildBuilder.build(weatherStructure: data)
        controllerView.addView(view: weekForecastChild.view,
                               height: Constants.CustomConstraints.weekForecastChildHeight)
        self.addChild(weekForecastChild)
        weekForecastChild.didMove(toParent: self)
    }
}
