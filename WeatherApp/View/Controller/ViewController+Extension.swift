//
//  ViewController+Extension.swift
//  Demo
//
//  Created by Vedvyas Kumar Rauniyar on 12/12/22.
//

import Foundation
import UIKit

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearch ? filterArray.count : weatherArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier) as? WeatherTableViewCell else { return UITableViewCell()}
         cell.setUpWeathercell(model: isSearch ? filterArray[indexPath.row] :weatherArray[indexPath.row])
        return cell
    }
}

// MARK: - UISearchResult Updating and UISearchControllerDelegate  Extension
  extension ViewController: UISearchResultsUpdating, UISearchControllerDelegate {
      func updateSearchResults(for searchController: UISearchController) {
          NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchCity(name:)), object: nil)
          perform(#selector(searchCity(name:)), with: searchController.searchBar.text, afterDelay: 0.5)
      }
      
  /// Searching for city and delay the search for .5 sec
  /// - Parameter name: name of city
    @objc func searchCity(name: String?) {
      if let text = name, text.isEmpty {
          isSearch = false
          reloadTableView()
      } else {
          if let searchText = name {
              filterArray = weatherArray.filter { model -> Bool in
                  return model.city.name?.lowercased()
                      .contains(searchText.lowercased()) ?? false
                }
              isSearch = true
              reloadTableView()
          }
      }
  }
}

// MARK: - WeatherDataProtocol
extension ViewController: WeatherDataProtocol {
    /// getting weather array from view model
    /// - Parameter data: array of WeatherModel
    func didRecieve(data: [WeatherModel]) {
        weatherArray = data
        DispatchQueue.main.async {
            self.reloadTableView()
        }
    }
}
