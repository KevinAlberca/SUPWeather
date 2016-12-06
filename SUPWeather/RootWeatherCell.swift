//
//  RootCellController.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 05/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import UIKit

class RootWeatherCell: UITableViewCell {
	
	static let identifier: String = "RootWeatherCellIdentifier"
	
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var contentLabel: UILabel!
	@IBOutlet weak var tempMinLabel: UILabel!
	@IBOutlet weak var tempMaxLabel: UILabel!
	@IBOutlet weak var weatherIcon: UIImageView!
	
}
