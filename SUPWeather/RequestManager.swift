
//
//  RequestManager.swift
//  SUPWeather
//
//  Created by Kevin Alberca on 05/11/2016.
//  Copyright © 2016 Kevin Alberca. All rights reserved.
//
import Foundation
import Alamofire
import AlamofireObjectMapper

class RequestManager {
	static public let sharedInstance = RequestManager()
	
	private let host = "https://api.darksky.net/forecast/"
	private let apiKey = ""
	
	public var actualCoordinate: (latitude: String, longitude: String)
	
	init(){
		actualCoordinate = (latitude: "48.8627", longitude: "2.2875")
	}
	
	func fetchWeatherForFiveDays(onSuccess success: @escaping ([Weather]) -> Void, onError error: @escaping (String) -> Void) {
		
		var strRequest = "\(host)\(apiKey)"
		strRequest += "/\(actualCoordinate.latitude),\(actualCoordinate.longitude)?units=auto&lang=fr&exclude=flags"
		
		Alamofire.request(strRequest).responseArray(keyPath: "daily.data") { (response: DataResponse<[Weather]>) in
			
			guard let weathers = response.result.value else {
				error("Request Manager -> No data when fetching \(strRequest)")
				return
			}
			success(weathers)
		}

	}
}
