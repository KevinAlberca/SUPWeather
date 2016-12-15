//
//  DetailsWeatherCell.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 14/12/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import UIKit

class DetailsWeatherCell: UITableViewCell {
	static let identifier: String = "DailyWeatherCellIdentifier"
	
	@IBOutlet weak var temperatureLabel: UILabel!
	@IBOutlet weak var hourLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var weatherIcon: UIImageView!
}
