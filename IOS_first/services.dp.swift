//
//  services.dp.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 31/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import Alamofire

struct servicesDP {

	static let paramDP = [
		"DepartureId" : "6733",
		"ArrivalId" : "1735",
		"StartVoyageDate" : "2014-11-04",
		"EndVoyageDate" : "2014-11-14",
		"TicketClass" : "0",
		"Adult" : "2",
		"HotelId" : "358469",
		"TicketId" : "777482078",
		"AddFilter" : "true",
		"_" : "1414760422014"
	]
	
	static func getHotels(params : [String: AnyObject] = paramDP){
		
		Alamofire.request(.GET, "http://lh.ios.inna.ru/api/v1/Packages/SearchHotels", parameters: params)
			.response { (request, response, data, error) in
				println(request)
				println(response, "response")
				println(error, "error")
		}
	}
	
	static func getTickets(param : [String: AnyObject] = paramDP){
		
		Alamofire.request(.GET, "http://lh.ios.inna.ru/api/v1/Packages/SearchTickets", parameters: param)
			.response { (request, response, data, error) in
				println(request)
				println(response, "response")
				println(error, "error")
		}
	}
}
