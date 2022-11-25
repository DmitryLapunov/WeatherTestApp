//
//  WeekForecastView.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class WeekForecastView: UIView {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Custom.bluishGray
        view.layer.cornerRadius = Constants.BasicConstraints.largeCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Images.Custom.calendar
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var forecastLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.weekForecast
        label.textColor = Colors.Custom.forecastGrayishWhite
        label.textAlignment = .left
        label.text = Contents.Strings.tenDayForecast
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Custom.separatorGrayishWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WeekForecastCell.self, forCellReuseIdentifier: WeekForecastCell.reuseIdentifier)
        tableView.separatorInset = UIEdgeInsets(top: Constants.Insets.zero,
                                                left: Constants.Insets.zero,
                                                bottom: Constants.Insets.zero,
                                                right: Constants.Insets.zero)
        tableView.separatorColor = Colors.Custom.separatorGrayishWhite
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = Constants.CellSize.tableViewRow
        tableView.backgroundColor = Colors.Custom.clearColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(backgroundView)
        backgroundView.addSubview(calendarImageView)
        backgroundView.addSubview(forecastLabel)
        backgroundView.addSubview(separatorView)
        backgroundView.addSubview(tableView)
    }
    
    private func setConstraints() {
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: Constants.BasicConstraints.largeLeading).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: Constants.BasicConstraints.largeTrailing).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        forecastLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor,
                                           constant: Constants.BasicConstraints.mediumTop).isActive = true
        forecastLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                               constant: Constants.CustomConstraints.forecastLabelLeading).isActive = true
        
        calendarImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                                   constant: Constants.CustomConstraints.calendarImageViewLeading).isActive = true
        calendarImageView.centerYAnchor.constraint(equalTo: forecastLabel.centerYAnchor).isActive = true
        calendarImageView.heightAnchor.constraint(equalToConstant: Constants.BasicConstraints.smallWeatherIcon).isActive = true
        calendarImageView.widthAnchor.constraint(equalToConstant: Constants.BasicConstraints.smallWeatherIcon).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: forecastLabel.bottomAnchor,
                                           constant: Constants.BasicConstraints.mediumTop).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                               constant: Constants.BasicConstraints.mediumLeading).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                constant: Constants.BasicConstraints.mediumTrailing).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        tableView.topAnchor.constraint(equalTo: separatorView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                           constant: Constants.BasicConstraints.mediumLeading).isActive = true
        tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                            constant: Constants.BasicConstraints.mediumTrailing).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,
                                          constant: Constants.CustomConstraints.tableViewBottom).isActive = true
    }
}
