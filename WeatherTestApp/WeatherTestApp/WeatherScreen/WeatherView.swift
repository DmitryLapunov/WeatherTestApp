//
//  WeatherView.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import UIKit

final class WeatherView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Constants.Spacing.childControllers
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setConstraints()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        assignbackground(frame: rect)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func assignbackground(frame: CGRect) {
        let background = Images.Custom.background
        lazy var imageView: UIImageView = {
            imageView = UIImageView(frame: frame)
            imageView.contentMode =  .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = self.center
            return imageView
        }()
        addSubview(imageView)
        sendSubviewToBack(imageView)
        self.backgroundColor = Colors.Custom.bluishGray
    }
    
    private func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    private func setConstraints() {
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    func addView(view: UIView, height: CGFloat? = nil) {
        stackView.addArrangedSubview(view)
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
