//
//  DetailsViewController.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 18/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class DetailsViewController: UITableViewController {
	
	@IBOutlet weak var weatherIV: UIImageView!
	var weatherIcon: String?
	let dataSource = DetailsTableDataSource()
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.dataSource = self.dataSource
		
		self.dataSource.updateWeather { [weak self] _ in
			self?.reload()
		}
		
		if let iconName = weatherIcon,
			let iconUrl = URL(string: RootTableDataSource.getIconUrl(iconName: iconName)) {
			weatherIV.af_setImage(withURL: iconUrl)
		}
	}
	
	// Reload data of controller
	func reload() {
		self.tableView.reloadData()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

