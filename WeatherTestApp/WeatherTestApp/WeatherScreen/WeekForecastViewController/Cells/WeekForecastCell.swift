//
//  WeekForecastCell.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class WeekForecastCell: UITableViewCell {
    
    static let reuseIdentifier = "WeekForecastCell"
    
    private lazy var weekdayLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.weekday
        label.textColor = Colors.Custom.basicWhite
        label.textAlignment = .left
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Constants.Spacing.weatherStack
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = Colors.Custom.basicWhite
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var probabilityLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.probability
        label.textColor = Colors.Custom.probabilityBlue
        label.textAlignment = .center
        label.numberOfLines = Constants.Label.singleLine
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.dayTemperature
        label.textColor = Colors.Custom.forecastGrayishWhite
        label.textAlignment = .center
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.dayTemperature
        label.textColor = Colors.Custom.basicWhite
        label.textAlignment = .right
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = Colors.Custom.clearColor
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSubviews() {
        contentView.addSubview(weekdayLabel)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(probabilityLabel)
        contentView.addSubview(minTemperatureLabel)
        contentView.addSubview(maxTemperatureLabel)
    }
    
    private func setConstraints() {
        weekdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        weekdayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                            constant: Constants.CustomConstraints.weatherStackTrailing).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: Constants.CustomConstraints.weatherStackWidth).isActive = true
        
        minTemperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                      constant: Constants.CustomConstraints.minTemperatureTrailing).isActive = true
        minTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        maxTemperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        maxTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func setupCell(_ object: WeekdayWeatherStructure) {
        weekdayLabel.text = CustomDateFormatter.shortWeekdayFromDate(unformattedDate: object.date)
        weatherImageView.image = object.weatherType.weatherIcon
        switch object.weatherType {
        case .clouds:
            weatherImageView.widthAnchor.constraint(equalToConstant: Constants.BasicConstraints.largeWeatherIcon).isActive = true
            weatherImageView.heightAnchor.constraint(equalToConstant: Constants.BasicConstraints.largeWeatherIcon).isActive = true
        case .snowfall:
            weatherImageView.widthAnchor.constraint(equalToConstant: Constants.BasicConstraints.mediumWeatherIcon).isActive = true
            weatherImageView.heightAnchor.constraint(equalToConstant: Constants.BasicConstraints.mediumWeatherIcon).isActive = true
            probabilityLabel.isHidden = false
            probabilityLabel.text = Contents.Strings.probability
        }
        minTemperatureLabel.text = object.minTemperature
        maxTemperatureLabel.text = object.maxTemperature
    }
}
