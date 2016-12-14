//
//  Weather.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 06/12/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import ObjectMapper

class WeeklyWeather: Mappable {
	var time: Int!
	var description: String = ""
	var iconName: String = "icon-default"
	var temperatureMin: Double = 0
	var temperatureMax: Double = 0
	
	
	required init?(map: Map) {
		guard ((map.JSON["time"] as? Int) != nil) else {
				return nil
		}
	}
	
	func mapping(map: Map) {
		time <- map["time"]
		description <- map["summary"]
		iconName <- map["icon"]
		temperatureMin <- map["temperatureMin"]
		temperatureMax <- map["temperatureMax"]
	}
}
