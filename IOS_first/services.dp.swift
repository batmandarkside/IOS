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
    
    static let requestCancel: Alamofire.Request?;


	static let paramDP = [
        "hotel" : "358469",
        "ticket" : "777489209",
		"DepartureId" : "6733",
		"ArrivalId" : "1735",
		"StartVoyageDate" : "2014-12-08",
		"EndVoyageDate" : "2014-12-19",
		"TicketClass" : "0",
		"Adult" : "2",
		"HotelId" : "358469",
		"TicketId" : "777489209",
		//"AddFilter" : "true",
		"_" : "1414855640197"
	]

	
    static func getHotels(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: AnyObject?)->(), hotelError: ()->(), complete: ()->()) {
		
        Alamofire.request(.GET, "http://www.lh.ios.inna.ru/api/v1/Packages/SearchHotels", parameters: params)
            .validate()
			.responseJSON { (request, response, data, error) in
				
                
                if(error != nil) {
                    println(error, "error")
                    println(request, "request")
                    hotelError()
                } else {

                    println(response, "response")

                    println("===============")
                    hotelSuccess(data: data?)
                    println("===============")
                }
                
                complete()
		}
	}
	
	static func getTickets(param : [String: AnyObject]? = paramDP, hotelSuccess: ()->(), hotelError: ()->(), complete: ()->()){
		
        Alamofire.request(.GET, "http://www.lh.ios.inna.ru/api/v1/Packages/SearchTickets", parameters: param)
			.responseJSON { (request, response, data, error) in
				println(request)
				println(response, "response")
				println(error, "error")
                
                complete()
		}
	}
    
    static func cancelRequest(){
        //requestCancel.cancel()
    }
}
