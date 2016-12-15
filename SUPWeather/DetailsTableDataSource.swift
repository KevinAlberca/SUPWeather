//
//  DetailTableDataSource.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 14/12/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import UIKit

class DetailsTableDataSource: NSObject, UITableViewDataSource {
	var dailyWeather: [DailyWeather]?
	
	//Get object for index row
	func getWeatherObject(forIndexRow row: Int) -> DailyWeather? {
		guard let weathers = self.dailyWeather,
			row < weathers.count else {
				return nil
		}
		
		return self.dailyWeather?[row]
	}
	
	// Fetch New Weather
	func updateWeather(completion: @escaping (Void) -> Void) {
		RequestManager.sharedInstance.fetchWeatherForDay(onSuccess: { [weak self] (result) in
			self?.dailyWeather = result
			completion()
		}){ (error) in
			print("Error => \(error)")
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.dailyWeather?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsWeatherCell.identifier) as? DetailsWeatherCell else {
			return UITableViewCell()
		}
		
		guard let data = self.dailyWeather?[indexPath.row] else {
			return cell
		}
		
		self.configure(tableViewCell: cell, withObjectWeather: data)
		return cell
	}
	
	func configure(tableViewCell cell: DetailsWeatherCell, withObjectWeather obj: DailyWeather) {
		guard let time = Date(timeIntervalSince1970: TimeInterval(obj.time)) as? Date,
			let description = obj.description as? String,
			let temperature = obj.temperature as? Double,
			let iconName = obj.iconName as? String else {
				print("Guard error : Data isn't valid type")
				return
		}
		
		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "fr_FR")
		formatter.dateFormat = "HH"
		let hour = formatter.string(from: time)
		
		cell.hourLabel.text = "\(hour)H"
		cell.temperatureLabel.text = "\(temperature)ºC"
		cell.descriptionLabel.text = "\(description)"
		
	}
}
