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
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 3
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var probabilityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = UIColor.clear
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
        
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -197).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        minTemperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100).isActive = true
        minTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        maxTemperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        maxTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func setupCell(_ object: WeekdayWeatherStructure) {
        weekdayLabel.text = CustomDateFormatter.shortWeekdayFromDate(unformattedDate: object.date)
        weatherImageView.image = object.weatherType.weatherIcon
        switch object.weatherType {
        case .clouds:
            weatherImageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
            weatherImageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        case .snowfall:
            weatherImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            weatherImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            probabilityLabel.isHidden = false
            probabilityLabel.text = "70 %"
        }
        minTemperatureLabel.text = object.minTemperature
        maxTemperatureLabel.text = object.maxTemperature
    }
}
