//
//  AppDelegateTests.swift
//  WeatherAppTests
//
//  Created by Vedvyas Kumar Rauniyar on 26/02/23.
//

import XCTest
@testable import WeatherApp

final class AppDelegateTests: XCTestCase {
   
    // MARK: - Variables
    var appDelegate: AppDelegate!
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    }
   
    override func setUp() {
        super.setUp()
    }
    
    func testAppDelegate(){
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        appDelegate = nil
    }
    
    func testDidFinishLaunchingWithOptions() {
       _ = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
    }
}
