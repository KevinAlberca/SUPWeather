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
		
		
		guard let data = self.resultWeather?[indexPath.row],
			let main = data["main"] as? Dictionary<String, Any>,
			let weather = data["weather"] as? Array<Dictionary<String, Any>>,
			let clouds = data["clouds"] as? Dictionary<String, Any>,
			let wind = data["wind"] as? Dictionary<String, Any>,
			let rain = data["rain"] as? Dictionary<String, Any> else {
				print("ERROR Guard : The type of let arn't available")
				return cell
		}
		
		return cell
	}
	
}
