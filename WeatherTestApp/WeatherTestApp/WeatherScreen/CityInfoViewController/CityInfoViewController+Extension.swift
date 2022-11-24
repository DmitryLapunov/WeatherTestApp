//
//  CityInfoViewController+Extension.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation

protocol CityInfoViewProtocol: AnyObject {
    func presentData(data: CityInfoStructure)
}

extension CityInfoViewController: CityInfoViewProtocol {
    func presentData(data: CityInfoStructure) {
        controllerView.setupView(data)
        controllerView.setNeedsDisplay()
    }
}
