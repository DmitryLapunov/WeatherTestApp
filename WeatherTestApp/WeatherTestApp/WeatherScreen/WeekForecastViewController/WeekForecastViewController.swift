//
//  WeekForecastViewController.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class WeekForecastViewController: UIViewController {
    
    var weekdayWeatherArray: [WeekdayWeatherStructure] = []
    var presenter: WeekForecastPresenterProtocol?
    let controllerView = WeekForecastView()
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.setupForecastData()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    private func setupView() {
        controllerView.tableView.dataSource = self
    }
}
