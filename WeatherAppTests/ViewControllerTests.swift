//
//  ViewControllerTests.swift
//  WeatherAppTests
//
//  Created by Vedvyas Kumar Rauniyar on 26/02/23.
//

import XCTest
@testable import WeatherApp

final class ViewControllerTests: XCTestCase {
   
    // MARK: - Variables
    var vcSuit: ViewController!

    // MARK: - Lifecycle
    override func setUpWithError() throws {
        vcSuit = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ViewController.identifier) as? ViewController
        vcSuit.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        vcSuit = nil
    }
    
    func testViewDidLoad(){
        vcSuit.viewDidLoad()
    }
    
    func testReloadTableView(){
        vcSuit.reloadTableView()
    }
    
    func testsetup(){
        vcSuit.setup()
    }
    
    func testSetupNavigationBar(){
        vcSuit.setupNavigationBar()
    }
    
    func testFetchWeatherData(){
        vcSuit.fetchWeatherData()
    }

}
