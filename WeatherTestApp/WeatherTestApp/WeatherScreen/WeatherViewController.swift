//
//  WeatherViewController.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class WeatherViewController: UIViewController {
    
    var presenter: WeatherPresenterProtocol?
    let controllerView = WeatherView()
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.presentViews()
    }
}
