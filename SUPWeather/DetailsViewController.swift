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
	var weatherObj: [Weather]!

	override func viewDidLoad() {
		super.viewDidLoad()
//		print("\(weatherObj["weather"][0])")
//		if let icon = weatherObj["weather"][0]["icon"] {
//			let iconUrl = URL(string: "http://openweathermap.org/img/w/\(icon).png")
//			self.weatherIV.af_setImage(withURL: iconUrl!)
//		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
