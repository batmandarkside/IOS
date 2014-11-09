//
//  services.dp.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 31/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit


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
    
    //private static let manager = AFHTTPRequestOperationManager()
    
    

    private static let paramDP = [
		"DepartureId" : "6733",
		"ArrivalId" : "1735",
		"StartVoyageDate" : "2015-02-10",
		"EndVoyageDate" : "2015-02-20",
		"TicketClass" : "0",
		"Adult" : "2",
		"HotelId" : "247116",
		"TicketId" : "966006679",
        "AddFilter" : "true"
	]
    
    /*

    */
    
    private static func completeDef(){}
    private static func errorDef(){}
	
    static func getHotels(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: AnyObject)->(),
        hotelError: ()->(), complete: ()->()) {

        HttpHelper.get("Packages/SearchHotels",
            params: params,
            callbackSuccess : hotelSuccess,
            callbackError: hotelError,
            complete: complete
        )
			
	}
    static func getHotels(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: AnyObject)->(),
        hotelError: ()->()) {
            
            HttpHelper.get("Packages/SearchHotels",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: hotelError,
                complete: completeDef
            )
    }
    
    static func getHotels(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: AnyObject)->()) {
            
            HttpHelper.get("Packages/SearchHotels",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: errorDef,
                complete: completeDef
            )
    }
    
    
    static func getTickets(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: AnyObject)->(),
        hotelError: ()->(), complete: ()->()){
            
            HttpHelper.get("Packages/SearchTickets",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: hotelError,
                complete: complete
            )
    }
    
	
	static func getTickets(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: AnyObject)->(),
        hotelError: ()->()){
        
        HttpHelper.get("Packages/SearchTickets",
            params: params,
            callbackSuccess : hotelSuccess,
            callbackError: hotelError,
            complete: completeDef
        )
	}
    
    static func getTickets(params : [String: AnyObject]? = paramDP, hotelSuccess: (data: AnyObject)->()){
            
            HttpHelper.get("Packages/SearchTickets",
                params: params,
                callbackSuccess : hotelSuccess,
                callbackError: errorDef,
                complete: completeDef
            )
    }
    
    static func cancelRequest(){
        
    }
}
