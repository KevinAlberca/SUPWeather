//
//  RootViewController.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 05/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
	
	var resultWeather: WeatherArray?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		RequestManager.sharedInstance.fetchWeather(onSuccess: { (result) in
			self.resultWeather = result
			self.reload()
		}){ (error) in
			print("Error => \(error)")
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
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return resultWeather?.count ?? 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: RootWeatherCell.identifier) as? RootWeatherCell else {
			return UITableViewCell()
		}
		
		guard let objWeather = self.resultWeather?[indexPath.row],
			let summary = objWeather["summary"] as? String,
			let time = objWeather["time"] as? Int else {
				return cell
		}
		
		cell.titleLabel.text = "\(time)"
		cell.contentLabel.text = summary
		
		return cell
	}

}

