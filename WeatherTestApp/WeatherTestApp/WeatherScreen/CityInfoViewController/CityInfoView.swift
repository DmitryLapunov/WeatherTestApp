//
//  CityInfoView.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class CityInfoView: UIView {
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.cityName
        label.textColor = Colors.Custom.basicWhite
        label.textAlignment = .center
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.cityWeather
        label.textColor = Colors.Custom.transparentWhite
        label.textAlignment = .center
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.Custom.clearColor
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSubviews() {
        addSubview(cityLabel)
        addSubview(weatherLabel)
    }
    
    private func setConstraints() {
        cityLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                       constant: Constants.CustomConstraints.cityLabelTop).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        weatherLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor,
                                          constant: Constants.CustomConstraints.weatherLabelTop).isActive = true
        weatherLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupView(_ object: CityInfoStructure) {
        cityLabel.text = NSLocalizedString(object.city, comment: "")
        weatherLabel.text = object.temperature
    }
}
