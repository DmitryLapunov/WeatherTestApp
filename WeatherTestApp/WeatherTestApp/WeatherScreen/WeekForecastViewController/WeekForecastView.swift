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
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "fi_calendar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var forecastLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.text = "10-дневный прогноз"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WeekForecastCell.self, forCellReuseIdentifier: WeekForecastCell.reuseIdentifier)
        tableView.separatorInset = UIEdgeInsets(top: 0,
                                                left: 0,
                                                bottom: 0,
                                                right: 0)
        tableView.separatorColor = UIColor.black
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 49
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        addSubview(backgroundView)
        backgroundView.addSubview(calendarImageView)
        backgroundView.addSubview(forecastLabel)
        backgroundView.addSubview(separatorView)
        backgroundView.addSubview(tableView)
    }
    
    private func setConstraints() {
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        forecastLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 14).isActive = true
        forecastLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 37).isActive = true
        
        calendarImageView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16).isActive = true
        calendarImageView.centerYAnchor.constraint(equalTo: forecastLabel.centerYAnchor).isActive = true
        calendarImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        calendarImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: forecastLabel.bottomAnchor, constant: 14).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 14).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -14).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        tableView.topAnchor.constraint(equalTo: separatorView.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 14).isActive = true
        tableView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -14).isActive = true
        tableView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -21).isActive = true
    }
}
