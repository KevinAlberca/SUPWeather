//
//  DetailsViewController.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 18/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
	
	var datas: WeatherArray = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		print("\(datas)")
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
