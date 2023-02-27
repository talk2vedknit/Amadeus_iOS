//
//  WeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Vedvyas Kumar Rauniyar on 26/02/23.
//

import XCTest
@testable import WeatherApp

final class WeatherViewModelTests: XCTestCase {
    
    // MARK: - Variables
    var weatherVM: WeatherViewModel!

    // MARK: - Lifecycle
    override func setUpWithError() throws {
        weatherVM = WeatherViewModel()
    }
    override func tearDownWithError() throws {
        weatherVM = nil
    }
    func testGetWeatherData(){
        weatherVM.getWeatherData()
    }
    
    func testParse(){
        let jsonData = readLocalJSONFile(forName: Constants.jsonName)
        if let data = jsonData {
            _ = weatherVM.parse(type: WeatherModel.self, jsonData: data)
        }
    }
}
