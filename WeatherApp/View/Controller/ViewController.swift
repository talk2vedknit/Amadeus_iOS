//
//  ViewController.swift
//  WeatherApp
//
//  Created by Vedvyas Kumar Rauniyar on 25/02/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var weatherTableView: UITableView!
    
    // MARK: - Variables
    var isSearch = false
    var weatherArray = [WeatherModel]()
    var filterArray = [WeatherModel]()
    var weatherViewModel: WeatherViewModel
    static let identifier = String(describing: ViewController.self)
     lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        //sc.definesPresentationContext = true
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false
         sc.searchBar.placeholder = Constants.placeholder
        return sc
    }()
    
    //Dependency Injection
    required init?(coder: NSCoder) {
        weatherViewModel = WeatherViewModel()
        super.init(coder: coder)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        setup()
    }
    
    /// Initial setup
    func setup(){
        setupNavigationBar()
        weatherViewModel.delegate = self
        fetchWeatherData()
    }
    
    /// Setting search in navigation
     func setupNavigationBar() {
         self.title = Constants.appName
          navigationItem.searchController = searchController
    }
    
    /// Fetching local data
    func fetchWeatherData(){
        weatherViewModel.getWeatherData()
    }
    
    /// Reloading TableView
    func reloadTableView(){
        weatherTableView.reloadData()
    }
}


