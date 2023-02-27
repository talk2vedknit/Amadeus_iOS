//
//  SceneDelegateTests.swift
//  WeatherAppTests
//
//  Created by Vedvyas Kumar Rauniyar on 26/02/23.
//

import XCTest
@testable import WeatherApp

final class SceneDelegateTests: XCTestCase {
  
    // MARK: - Variables
    var scene: UIScene!
    var sceneDelegate: SceneDelegate!
  
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        scene = UIApplication.shared.connectedScenes.first
        sceneDelegate = scene?.delegate as? SceneDelegate
    }

    override func tearDownWithError() throws {
        sceneDelegate = nil
    }

    func testSceneDidDisconnect(){
        sceneDelegate.sceneDidDisconnect(scene)
    }
    func testSceneDidBecomeActive(){
        sceneDelegate.sceneDidBecomeActive(scene)
    }
    func testSceneWillResignActive(){
        sceneDelegate.sceneWillResignActive(scene)
    }
    func testSceneWillEnterForeground(){
        sceneDelegate.sceneWillEnterForeground(scene)
    }
    func testSceneDidEnterBackground(){
        sceneDelegate.sceneDidEnterBackground(scene)
    }
}
