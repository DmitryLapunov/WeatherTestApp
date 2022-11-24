//
//  CityInfoBuilder.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

final class CityInfoBuilder {
    func build(weatherStructure: WeatherStructure) -> CityInfoViewController {
        let view = CityInfoViewController()
        let presenter = CityInfoPresenter(view: view,
                                          weatherStructure: weatherStructure)
        view.presenter = presenter
        return view
    }
}
