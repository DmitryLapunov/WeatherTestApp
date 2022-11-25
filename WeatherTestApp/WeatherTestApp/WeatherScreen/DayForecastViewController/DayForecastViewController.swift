//
//  DayForecastViewController.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class DayForecastViewController: UIViewController {
    
    var weatherPerDay: [TodayWeatherStructure] = []
    var presenter: DayForecastPresenterProtocol?
    let controllerView = DayForecastView()
    
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
        controllerView.collectionView.delegate = self
        controllerView.collectionView.dataSource = self
    }
}
