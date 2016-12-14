//
//  DailyWeather.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 10/12/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import ObjectMapper

class DailyWeather: Mappable {
	var time: Int!
	var description: String = ""
	var iconName: String = "icon-default"
	var temperature: Double = 0
	var windSpeed: Double = 0
	
	
	required init?(map: Map) {
		guard ((map.JSON["time"] as? Int) != nil) else {
			return nil
		}
	}
	
	func mapping(map: Map) {
		time <- map["time"]
		description <- map["summary"]
		iconName <- map["icon"]
		temperature <- map["temperature"]
		windSpeed <- map["windSpeed"]
	}
}
