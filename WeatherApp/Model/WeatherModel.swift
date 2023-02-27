//
//  WeatherModel.swift
//  Demo
//
//  Created by Vedvyas Kumar Rauniyar on 24/02/23.
//

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable {
 let city: City
 let main: Main
}

// MARK: - City
struct City: Codable {
 let id: Int?
 let name, findname, country: String?
 let coord: Coord?
 let zoom: Int?
}
// MARK: - Coord
struct Coord: Codable {
 let lon, lat: Double?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
}
