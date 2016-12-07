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
	
	var resultWeather: [Weather]?
	
	lazy var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "fr_FR")
		formatter.dateFormat = "EEEE d MMM"
		return formatter
	}()
	
	//Get object for index row
	func getWeatherObject(forIndexRow row: Int) -> Weather? {
		guard let weathers = self.resultWeather,
			row < weathers.count else {
			return nil
		}
		
		return self.resultWeather?[row]
	}
	
	
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
	
	func configure(tableViewCell cell: RootWeatherCell, withObjectWeather obj: Weather) {
		
		guard let time = obj.time as? Int,
			let icon = obj.iconName as? String,
			let description = obj.description as? String,
			let tempMin = obj.temperatureMin as? Double,
			let tempMax = obj.temperatureMax as? Double else {
				print("ERROR Guard : The type of let arn't available")
				return
		}
		
		let date = Date(timeIntervalSince1970: TimeInterval(time))
		let strDateFormatted = self.dateFormatter.string(from: date)

		cell.titleLabel.text = "\(strDateFormatted)"
		cell.contentLabel.text = "\(description)"
		cell.tempMinLabel.text = "\(tempMin) ºC"
		cell.tempMaxLabel.text = "\(tempMax) ºC"

		print("\(icon)")
		let iconUrlString = getIconUrl(iconName: icon)
		
		if let iconUrl = URL(string: iconUrlString) {
			cell.weatherIcon.af_setImage(withURL: iconUrl)
		}
	}
	
	func getIconUrl(iconName: String) -> String {
		
		var iconNamesDict: [String:String] = [
			"clear-day": "01d",
			"clear-night": "01n",
			"partly-cloudy-day": "02d",
			"partly-cloudy-night": "02n",
			"cloudy": "03d", // Nuageux
			"rain": "10d", // Pluie
			"sleet": "13d", // Neige fondue -> Neige
			"snow": "13d", // Neige
			"fog": "03d", // Brouillard
			"wind": "50d"
		]
		
		var iconUrl = "http://openweathermap.org/img/w/"
		iconUrl += iconNamesDict[iconName]!
		iconUrl += ".png"
		
		return iconUrl
	}

}
