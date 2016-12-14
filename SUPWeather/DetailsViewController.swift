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

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let iconName = weatherIcon,
			let iconUrl = URL(string: RootTableDataSource.getIconUrl(iconName: iconName)) {
			weatherIV.af_setImage(withURL: iconUrl)
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}
