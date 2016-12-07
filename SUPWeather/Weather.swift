//
//  Weather.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 06/12/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
	var time: Int!
	var description: String = ""
	var iconName: String = "icon-default"
	var temperature: Double!
	var temperatureMin: Double = 0
	var temperatureMax: Double = 0
	
	
	required init?(map: Map) {
		guard let main = map.JSON["main"] as? Dictionary<String, Any>,
			((map.JSON["dt"] as? Int) != nil), (main["temp"] as? Double != nil) else {
			return nil
		}
	}
	
	func mapping(map: Map) {
		time <- map["dt"]
		description <- map["weather.0.main"]
		iconName <- map["weather.0.icon"]
		temperature <- map["main.temp"]
		temperatureMin <- map["main.temp_min"]
		temperatureMax <- map["main.temp_max"]
	}
}
