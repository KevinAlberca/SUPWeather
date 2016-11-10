
//
//  RequestManager.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 05/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//
import Foundation
import Alamofire

typealias WeatherArray = Array<Dictionary<String, Any>>

class RequestManager {
	static public let sharedInstance = RequestManager()
	
	private let host = "http://api.openweathermap.org/data/2.5"
	private let apiKey = ""
	
	public var actualCoordinate: (latitude: String, longitude: String)
	
	init(){
		actualCoordinate = (latitude: "48.8627", longitude: "2.2875")
	}
	
	func fetchWeather(onSuccess success: @escaping (WeatherArray) -> Void, onError error: @escaping (String) -> Void) {
		
		var strRequest = "\(host)"
		strRequest += "/forecast?lat=\(actualCoordinate.latitude)&lon=\(actualCoordinate.longitude)&apiKey=\(apiKey)"
		
		print("\(strRequest)")
		
		Alamofire.request(strRequest).responseJSON { response in
			//			print(response.request!)  // original URL request
			//			print(response.response!) // HTTP URL response
			//			print(response.data!)     // server data
			print(response.result)   // result of response serialization
			
			
			guard let JSON = response.result.value as? Dictionary<String, Any> else {
				error("Request Manager -> No data when fetching \(strRequest)")
				return
			}
			
			guard let data = JSON["list"] as? Array<Dictionary<String, Any>> else {
				error("Request Manager JSON Parsing error")
				return
			}
			
			success(data)
		}
	}
	
	
	
}
