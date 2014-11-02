//
//  services.dp.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 31/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


/*

If the responseObject is NSDictionary or NSArray
let json = JSON(responseObject)

If the responseObject is NSData
let json = JSON(data: responseObject)

*/

//typealias JSONDictionary = Dictionary<String, JSON>


/*
    Методы получения списка отелей и билетов
    Оба метода перегруженны
*/
struct ServicesDP {
    
    private static let requestCancel: Alamofire.Request?;
    

    private static let paramDP = [
        "hotel" : "358469",
        "ticket" : "777489209",
		"DepartureId" : "6733",
		"ArrivalId" : "18820",
		"StartVoyageDate" : "2014-12-09",
		"EndVoyageDate" : "2014-12-19",
		"TicketClass" : "0",
		"Adult" : "2",
		"HotelId" : "455514",
		"TicketId" : "942032620",
		//"AddFilter" : "true",
		"_" : "1414925006760"
	]

    /*

    */
    
    private static func completeDef(){}
    private static func errorDef(){}
	
    static func getHotels(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: NSDictionary)->(),
        hotelError: ()->(), complete: ()->()) {
		
        HttpHelper.get("Packages/SearchHotels",
            params: params,
            callbackSuccess : hotelSuccess,
            callbackError: hotelError,
            complete: complete
        )
			
	}
    static func getHotels(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: NSDictionary)->(),
        hotelError: ()->()) {
            
            HttpHelper.get("Packages/SearchHotels",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: hotelError,
                complete: completeDef
            )
    }
    
    static func getHotels(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: NSDictionary)->()) {
            
            HttpHelper.get("Packages/SearchHotels",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: errorDef,
                complete: completeDef
            )
    }
    
    
    static func getTickets(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: NSDictionary)->(),
        hotelError: ()->(), complete: ()->()){
            
            HttpHelper.get("Packages/SearchTickets",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: hotelError,
                complete: complete
            )
    }
    
	
	static func getTickets(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: NSDictionary)->(),
        hotelError: ()->()){
        
        HttpHelper.get("Packages/SearchTickets",
            params: params,
            callbackSuccess : hotelSuccess,
            callbackError: hotelError,
            complete: completeDef
        )
	}
    
    static func getTickets(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: NSDictionary)->()){
            
            HttpHelper.get("Packages/SearchTickets",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: errorDef,
                complete: completeDef
            )
    }
    
    static func cancelRequest(){
        requestCancel?.cancel()
    }
}
