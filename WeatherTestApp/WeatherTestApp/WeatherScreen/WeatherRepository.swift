//
//  WeatherRepository.swift
//  WeatherTestApp
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation

typealias WeatherHandler = (Result<WeatherStructure, Error>) -> Void

protocol WeatherRepositoryProtocol: AnyObject {
    func fetchWeather(completion: @escaping WeatherHandler)
}

final class WeatherRepository: WeatherRepositoryProtocol {
    func fetchWeather(completion: @escaping WeatherHandler) {
        let fetchResponse = readJsonFile(fileName: Contents.Strings.jsonName)
        switch fetchResponse {
        case .success(let fetchedData):
            do {
                let weatherModel: WeatherModel = try JSONDecoder().decode(WeatherModel.self, from: fetchedData)
                let weatherStructure = WeatherStructure(weather: weatherModel)
                completion(.success(weatherStructure))
            } catch let error {
                completion(.failure(error))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    private func readJsonFile(fileName: String) -> Result<Data, Error> {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: Contents.Strings.jsonType),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return .success(jsonData)
            } else {
                return .failure(AppErrors.jsonError)
            }
        } catch let error {
            return .failure(error)
        }
    }
}
