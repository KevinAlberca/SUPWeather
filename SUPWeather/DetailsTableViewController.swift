//
//  DetailsTableViewController.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 10/12/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import UIKit

class DetailsTableViewController: UITableViewController {
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
//		self.tableView.dataSource = self.weatherDataSource
//		
//		self.weatherDataSource.updateWeather { [weak self] _ in
//			self?.reload()
//		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// Reload data of controller
	func reload() {
		self.tableView.reloadData()
	}
}
