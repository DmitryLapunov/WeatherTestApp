//
//  DayForecastView.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class DayForecastView: UIView {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 14
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.register(DayForecastCell.self, forCellWithReuseIdentifier: DayForecastCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: 14,
                                                   bottom: 0,
                                                   right: 14)
        collectionView.backgroundColor = UIColor.clear
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        backgroundView.addSubview(weatherLabel)
        backgroundView.addSubview(separatorView)
        backgroundView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        weatherLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 14).isActive = true
        weatherLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 14).isActive = true
        weatherLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -14).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 14).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 14).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -14).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 14).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -14).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    func setupView(_ object: DayForecastStructure) {
        weatherLabel.text = object.description
    }
}
