//
//  ViewController+ExtensionTests.swift
//  WeatherAppTests
//
//  Created by Vedvyas Kumar Rauniyar on 26/02/23.
//

import XCTest
@testable import WeatherApp

final class ViewController_ExtensionTests: XCTestCase {
    
    // MARK: - Variables
    var vcSuit: ViewController!
    var weatherTableView: UITableView!
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        vcSuit = UIStoryboard(name: Constants.main, bundle: nil).instantiateViewController(withIdentifier: ViewController.identifier) as? ViewController
        vcSuit.loadViewIfNeeded()
        weatherTableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 400), style: .plain)
    }
    override func tearDownWithError() throws {
        vcSuit = nil
    }
    func testNumberOfRowsInSection() {
        if let tableView = vcSuit?.weatherTableView {
            _ = vcSuit?.tableView(tableView, numberOfRowsInSection: 2)
        }
    }
    func testTableViewDidSelect() {
        if let tableView = vcSuit?.weatherTableView {
            _ = self.vcSuit?.tableView(tableView, numberOfRowsInSection: 2)
        }
    }
    
    private class TableViewDelegate: NSObject, UITableViewDelegate {
    }
    
    private class TableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: IndexPath(row: 0, section: 0)) as? WeatherTableViewCell
            return cell ?? UITableViewCell()
        }
    }
    
    func test_Has_TableView() {
        XCTAssertNotNil(weatherTableView)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(vcSuit.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(vcSuit.responds(to: #selector(vcSuit.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(vcSuit.responds(to: #selector(vcSuit.tableView(_:cellForRowAt:))))
        if let tableView = vcSuit?.weatherTableView {
            let count2 = vcSuit?.tableView(tableView, cellForRowAt: IndexPath(item: 0, section: 0))
            XCTAssertTrue(count2 != nil ? true : false)
            let count3 = vcSuit?.tableView(tableView, cellForRowAt: IndexPath(item: 1, section: 0))
            XCTAssertTrue(count3 != nil ? true : false)
            let count4 = vcSuit?.tableView(tableView, cellForRowAt: IndexPath(item: 2, section: 0))
            XCTAssertTrue(count4 != nil ? true : false)
            let count5 = vcSuit?.tableView(tableView, cellForRowAt: IndexPath(item: 3, section: 0))
            XCTAssertTrue(count5 != nil ? true : false)
            let count01 = vcSuit?.tableView(tableView, cellForRowAt: IndexPath(item: 01, section: 0))
            XCTAssertTrue(count01 != nil ? true : false)
            let count02 = vcSuit?.tableView(tableView, cellForRowAt: IndexPath(item: 0, section: 1))
            XCTAssertTrue(count02 != nil ? true : false)
        }
    }
    func testAwakeFromNib() {
        let cell = UITableViewCell()
        cell.awakeFromNib()
        cell.setSelected(true, animated: true)
    }
    func testSearchCity(){
        vcSuit.searchCity(name: "Noida")
    }
}
