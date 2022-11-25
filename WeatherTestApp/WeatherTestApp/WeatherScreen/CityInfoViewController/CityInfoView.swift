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
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
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
        cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        weatherLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 6).isActive = true
        weatherLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupView(_ object: CityInfoStructure) {
        cityLabel.text = NSLocalizedString(object.city, comment: "")
        weatherLabel.text = object.temperature
    }
}
