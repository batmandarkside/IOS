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
    //private static let manager = AFHTTPRequestOperationManager()
    
    

    private static let paramDP = [
        "hotel" : "358469",
        "ticket" : "777489209",
		"DepartureId" : "6733",
		"ArrivalId" : "6623",
		"StartVoyageDate" : "2015-02-10",
		"EndVoyageDate" : "2015-02-13",
		"TicketClass" : "0",
		"Adult" : "2",
		"HotelId" : "311565",
		"TicketId" : "949211536",
        "Id":"949211536"
	]
    
    /*

    */
    
    private static func completeDef(){}
    private static func errorDef(){}        
    
    /*static func getHotelsAfNetworking(){
        let baseUrl: String = "http://www.inna.ru/"
        let baseUrlApi: String = "api/v1/"
        let urlHotels: String = "Packages/SearchHotels"

        
        self.manager.GET( baseUrl + baseUrlApi + urlHotels,
            parameters: self.paramDP,
            success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                let str: NSDictionary = responseObject as NSDictionary
                let Filters: NSDictionary = str["Filters"] as NSDictionary
                println(Filters)
            
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
    }*/
	
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
