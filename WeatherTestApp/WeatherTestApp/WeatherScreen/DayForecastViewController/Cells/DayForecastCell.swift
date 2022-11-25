//
//  DayForecastCell.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class DayForecastCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: DayForecastCell.self)
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.clear
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSubviews() {
        contentView.addSubview(topLabel)
        contentView.addSubview(weatherImageView)
        contentView.addSubview(bottomLabel)
    }
    
    private func setConstraints() {
        topLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        weatherImageView.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 3).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        weatherImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 10).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    func setupCell(_ object: TodayWeatherStructure) {
        let currentHour = String(Calendar.current.component(.hour, from: Date()))
        topLabel.text = currentHour == object.timestamp ? "Сейчас" : object.timestamp
        if object.sunset {
            weatherImageView.image = UIImage(systemName: "sunset.fill")?.withRenderingMode(.alwaysOriginal)
            bottomLabel.font = UIFont.systemFont(ofSize: 18)
            bottomLabel.text = "Заход солнца"
        } else {
            weatherImageView.image = object.weatherType.weatherIcon
            bottomLabel.font = UIFont.systemFont(ofSize: 16)
            bottomLabel.text = object.temperature
        }
    }
}
