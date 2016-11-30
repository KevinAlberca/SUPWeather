//
//  RootTableDataSource.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 15/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class RootTableDataSource: NSObject, UITableViewDataSource {
	
	var resultWeather: WeatherArray?
	
	lazy var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "fr_FR")
		formatter.dateFormat = "EEEE d MMM"
		return formatter
	}()
	
	
	// Fetch New Weather
	func updateWeather(completion: @escaping (Void) -> Void) {
		RequestManager.sharedInstance.fetchWeatherForFiveDays(onSuccess: { [weak self] (result) in
			self?.resultWeather = result
			completion()
		}){ (error) in
			print("Error => \(error)")
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return resultWeather?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: RootWeatherCell.identifier) as? RootWeatherCell else {
			return UITableViewCell()
		}
		
		guard let data = self.resultWeather?[indexPath.row] else {
			return cell
		}
		
		self.configure(tableViewCell: cell, withObjectWeather: data)
		return cell
	}
	
	func configure(tableViewCell cell: RootWeatherCell, withObjectWeather obj: [String: Any]) {
		guard let main = obj["main"] as? Dictionary<String, Any>,
			let weather = obj["weather"] as? Array<Dictionary<String, Any>>,
			let clouds = obj["clouds"] as? Dictionary<String, Any>,
			let wind = obj["wind"] as? Dictionary<String, Any>,
			let time = obj["dt"] as? Double else {
				print("ERROR Guard : The type of let arn't available")
				return
		}
		
//		print("Data \(obj)")
//		print("Main \(main)")
//		print("Weather \(weather[0]["icon"])")
//		print("Clouds : \(clouds)")
//		print("Wind : \(wind)")
//		print("Rain : \(rain)")
		
		let date = Date(timeIntervalSince1970: time)
		let strDateFormatted = self.dateFormatter.string(from: date)
		
		cell.titleLabel.text = "City of User"
		cell.contentLabel.text = "\(weather[0]["description"]!)"
		cell.updateTimeLabel.text = "\(strDateFormatted)"
		
		if let icon = weather[0]["icon"] {
			let iconUrl = URL(string: "http://openweathermap.org/img/w/\(icon).png")
			cell.weatherIcon.af_setImage(withURL: iconUrl!)
		}
	}

}
