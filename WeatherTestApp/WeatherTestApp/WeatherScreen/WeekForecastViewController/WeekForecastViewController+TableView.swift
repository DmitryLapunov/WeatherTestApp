//
//  WeekForecastViewController+TableView.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 25.11.22.
//

import Foundation
import UIKit

extension WeekForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdayWeatherArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeekForecastCell.reuseIdentifier, for: indexPath)
        let weekForecastCell = cell as? WeekForecastCell
        weekForecastCell?.setupCell(weekdayWeatherArray[indexPath.row])
        return weekForecastCell ?? UITableViewCell()
    }
}
