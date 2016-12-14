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

class DetailsViewController: UIViewController {
	
	@IBOutlet weak var weatherIV: UIImageView!
	var dailyWeather: [DailyWeather]?
	var weatherIcon: String?
	let detailTableVC = DetailsTableViewController()

	override func viewDidLoad() {
		super.viewDidLoad()

		RequestManager.sharedInstance.fetchWeatherForDay(onSuccess: { [weak self] (result) in
			print("\(result)")
			self?.dailyWeather = result
		}) { (error) in
			print("Error : \(error)")
		}
		
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
