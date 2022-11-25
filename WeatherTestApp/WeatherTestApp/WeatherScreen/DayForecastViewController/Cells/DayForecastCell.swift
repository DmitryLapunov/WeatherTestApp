//
//  DayForecastCell.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class DayForecastCell: UICollectionViewCell {
    
    static let reuseIdentifier = "DayForecastCell"
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.timestamp
        label.textColor = Colors.Custom.basicWhite
        label.textAlignment = .center
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.Custom.basicWhite
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.Custom.basicWhite
        label.textAlignment = .center
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Colors.Custom.clearColor
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
        weatherImageView.widthAnchor.constraint(equalToConstant: Constants.BasicConstraints.largeWeatherIcon).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: Constants.BasicConstraints.largeWeatherIcon).isActive = true
        weatherImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        bottomLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor,
                                         constant: Constants.CustomConstraints.bottomLabelTop).isActive = true
        bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    func setupCell(_ object: TodayWeatherStructure) {
        let currentHour = String(Calendar.current.component(.hour, from: Date()))
        topLabel.text = currentHour == object.timestamp ? Contents.Strings.currentTime : object.timestamp
        if object.sunset {
            if #available(iOS 14, *) {
                weatherImageView.image = Images.System.sunset.withRenderingMode(.alwaysOriginal)
            } else {
                weatherImageView.image = Images.Custom.sunset
            }
            bottomLabel.font = Fonts.Custom.timestampSunset
            bottomLabel.text = Contents.Strings.sunset
        } else {
            weatherImageView.image = object.weatherType.weatherIcon
            bottomLabel.font = Fonts.Custom.timestampTemperature
            bottomLabel.text = object.temperature
        }
    }
}
