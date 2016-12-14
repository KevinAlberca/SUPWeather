//
//  RootViewController.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 05/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//
import UIKit

class RootViewController: UITableViewController {
	
	let weatherDataSource = RootTableDataSource()
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.tableView.dataSource = self.weatherDataSource
		
		self.weatherDataSource.updateWeather { [weak self] _ in
			self?.reload()
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Reload data of controller
	func reload() {
		self.tableView.reloadData()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "viewDetailOfWeatherSegue" {
			guard let selectedIndex = self.tableView.indexPathForSelectedRow,
				let weatherObj = self.weatherDataSource.getWeatherObject(forIndexRow: selectedIndex.row) else { /* Return alert here */ return }
//
			guard let detailViewController = segue.destination as? DetailsViewController else { return }
//
			detailViewController.weatherIcon = weatherObj.iconName
		}
	}
	
}
