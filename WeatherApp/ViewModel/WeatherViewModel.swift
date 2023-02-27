//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Vedvyas Kumar Rauniyar on 25/02/23.
//

import Foundation

protocol WeatherDataProtocol: AnyObject {
    func didRecieve(data: [WeatherModel])
}

class WeatherViewModel {
    
    // MARK: - Variables
    weak var delegate: WeatherDataProtocol?
    
    // MARK: - Function
    /// get Weather from local json
    /// and parse the data
    func getWeatherData(){
        let jsonData = readLocalJSONFile(forName: Constants.jsonName)
        if let data = jsonData {
            if let weatherRecords = parse(type: WeatherModel.self, jsonData: data) {
                self.delegate?.didRecieve(data: weatherRecords)
            }
        }
    }
    
    /// Parse the jsonData using the JSONDecoder with help of WeatherModel model
    /// - Parameter jsonData: WeatherModel object
    func parse<T: Decodable>(type: T.Type, jsonData: Data) -> [T]? {
        do {
            let decodedData = try JSONDecoder().decode([T].self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
