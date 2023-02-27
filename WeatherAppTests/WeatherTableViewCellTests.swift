//
//  WeatherTableViewCellTests.swift
//  WeatherAppTests
//
//  Created by Vedvyas Kumar Rauniyar on 26/02/23.
//

import XCTest
@testable import WeatherApp

final class WeatherTableViewCellTests: XCTestCase {
    
    // MARK: - Variables
    var weatherCell: WeatherTableViewCell!
    var weatherVM: WeatherViewModel!
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        weatherVM = WeatherViewModel()
        weatherCell = WeatherTableViewCell()
        weatherCell.setSelected(true, animated: true)
        weatherCell.awakeFromNib()
        weatherCell.layoutSubviews()
    }
    
    override func tearDownWithError() throws {
        weatherCell = nil
    }
    
    func testAwakeFromNib(){
        weatherCell.awakeFromNib()
    }
    func testSetUpWeathercell(){
        let jsonData = readLocalJSONFile(forName: Constants.jsonName)
        if let data = jsonData {
            if let weatherRecords = weatherVM.parse(type: WeatherModel.self, jsonData: data){
                weatherCell.setUpWeathercell(model: weatherRecords[0])
            }
        }
    }
}
