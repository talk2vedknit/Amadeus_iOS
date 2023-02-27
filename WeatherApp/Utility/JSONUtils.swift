//
//  JSONUtils.swift
//  WeatherApp
//
//  Created by Vedvyas Kumar Rauniyar on 25/02/23.
//  Copyright © 2023 Vedvyas Kumar Rauniyar. All rights reserved.
//

import Foundation


// MARK: - Helper methods for reading & parsing the JSON file.

/// Method to read the local json file.
/// - Parameter name: file name
/// - Returns: return file contents in Data format.
func readLocalJSONFile(forName name: String) -> Data? {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: Constants.json) {
            let fileUrl = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileUrl)
            return data
        }
    } catch {
        print("error: \(error)")
    }
    return nil
}
