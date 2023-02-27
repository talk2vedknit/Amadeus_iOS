//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Vedvyas Kumar Rauniyar on 25/02/23.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
   
    // MARK: - Outlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latLongLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    // MARK: - Variables
    static let identifier = String(describing: WeatherTableViewCell.self)
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /// Setup Tableview cell
    /// - Parameter model: WeatherModel
    func setUpWeathercell(model: WeatherModel){
        nameLabel?.text = Constants.cityName + (model.city.name ?? "")
        countryLabel?.text = Constants.conutryCode + (model.city.country ?? "")
        tempLabel?.text = Constants.temperature + ("\(model.main.temp ?? 0.0)")
        latLongLabel?.text = Constants.lat + ("\(model.city.coord?.lat ?? 0.0) Long: \(model.city.coord?.lon ?? 0.0)")
    }
}
