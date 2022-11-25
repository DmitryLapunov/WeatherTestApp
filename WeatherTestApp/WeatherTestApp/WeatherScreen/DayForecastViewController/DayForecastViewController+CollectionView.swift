//
//  DayForecastViewController+CollectionView.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation
import UIKit

extension DayForecastViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let currentHour = String(Calendar.current.component(.hour, from: Date()))
        let topLabelText = currentHour == weatherPerDay[indexPath.row].timestamp ? Contents.Strings.currentTime : weatherPerDay[indexPath.row].timestamp
        let topLabelWidth = Int(topLabelText.size(withAttributes: [
            NSAttributedString.Key.font : Fonts.Custom.timestamp as Any
        ]).width)
                
        let bottomLabelText = weatherPerDay[indexPath.row].sunset ? Contents.Strings.sunset : weatherPerDay[indexPath.row].temperature
        var bottomLabelWidth = 0
        if weatherPerDay[indexPath.row].sunset {
            bottomLabelWidth = Int(bottomLabelText.size(withAttributes: [
                NSAttributedString.Key.font : Fonts.Custom.timestampSunset as Any
            ]).width)
        } else {
            bottomLabelWidth = Int(bottomLabelText.size(withAttributes: [
                NSAttributedString.Key.font : Fonts.Custom.timestampTemperature as Any
            ]).width)
        }
        
        let fixedCellWidth = Constants.CellSize.fixedCellWidth
        let width = CGFloat(max(topLabelWidth, fixedCellWidth, bottomLabelWidth))
        let height: CGFloat = Constants.CellSize.collectionViewHeight
        return CGSize(width: width, height: height)
    }
}

extension DayForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherPerDay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayForecastCell.reuseIdentifier, for: indexPath)
        let dayForecastCell = cell as? DayForecastCell
        dayForecastCell?.setupCell(weatherPerDay[indexPath.row])
        return dayForecastCell ?? UICollectionViewCell()
    }
}
