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
        view.backgroundColor = Colors.Custom.bluishGray
        view.layer.cornerRadius = Constants.BasicConstraints.largeCornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.Custom.weatherDescription
        label.textColor = Colors.Custom.basicWhite
        label.textAlignment = .left
        label.numberOfLines = Constants.Label.infiniteLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Custom.separatorGrayishWhite
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.Spacing.collectionView
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.register(DayForecastCell.self, forCellWithReuseIdentifier: DayForecastCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: Constants.Insets.zero,
                                                   left: Constants.Insets.medium,
                                                   bottom: Constants.Insets.zero,
                                                   right: Constants.Insets.medium)
        collectionView.backgroundColor = Colors.Custom.clearColor
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        backgroundView.addSubview(weatherLabel)
        backgroundView.addSubview(separatorView)
        backgroundView.addSubview(collectionView)
    }
    
    private func setConstraints() {
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                constant: Constants.BasicConstraints.largeLeading).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                 constant: Constants.BasicConstraints.largeTrailing).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        weatherLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor,
                                          constant: Constants.BasicConstraints.mediumTop).isActive = true
        weatherLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                              constant: Constants.BasicConstraints.mediumLeading).isActive = true
        weatherLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                               constant: Constants.BasicConstraints.mediumTrailing).isActive = true
        
        separatorView.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor,
                                           constant: Constants.BasicConstraints.mediumTop).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,
                                               constant: Constants.BasicConstraints.mediumLeading).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor,
                                                constant: Constants.BasicConstraints.mediumTrailing).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor,
                                            constant: Constants.BasicConstraints.mediumTop).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor,
                                               constant: Constants.BasicConstraints.mediumBottom).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: Constants.CellSize.collectionViewHeight).isActive = true
    }
    
    func setupView(_ object: DayForecastStructure) {
        weatherLabel.text = object.description
    }
}
