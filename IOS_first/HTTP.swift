//
//  HTTP.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 29/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation


class DKHttp {
	
	var DepartureId: Int
	var ArrivalId: Int
	var StartVoyageDate: String
	var EndVoyageDate: String
	var TicketClass: Int
	var Adult: Int
	var Children : Int?
	var HotelId: Int?
	var TicketId: Int?
	var test : Int = 1414590351222
	var urlRequest : AnyObject?

	
	/// A newly minted HTTPTask for your enjoyment.
	init() {
	
		DepartureId = Int(6733)
		ArrivalId = 1735
		StartVoyageDate = "2014-11-03"
		EndVoyageDate = "2014-11-13"
		TicketClass = 0
		Adult = 2
		
		var URL : String = "http://beta.inna.ru/api/v1/Packages/SearchHotels"
		var _ : Int = 1414590351222
		var urlConcatinate : String = ""
		
		urlConcatinate += URL+"?"
		urlConcatinate += "DepartureId=\(DepartureId)"
		urlConcatinate += "&ArrivalId=\(ArrivalId)"
		urlConcatinate += "&StartVoyageDate=\(StartVoyageDate)"
		urlConcatinate += "&EndVoyageDate=\(EndVoyageDate)"
		urlConcatinate += "&TicketClass=\(TicketClass)"
		urlConcatinate += "&Adult=\(Adult)"
		
		urlRequest = NSURL(string: urlConcatinate)
		
		println(urlRequest)
	}
	
	
	func getHTTP<T>(dataForHttp : T) -> T{
		return dataForHttp
	}
	
	func postHTTP<T>(dataForHttp : T) -> T{
		return dataForHttp
	}
}
