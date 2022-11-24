//
//  CityInfoViewController.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

class CityInfoViewController: UIViewController {
    
    var presenter: CityInfoPresenterProtocol?
    let controllerView = CityInfoView()
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupWeatherData()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
}
