//
//  Http.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 10/30/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation

import Alamofire

class DKHttp {
    
    let parameters = [
        "hotel" : "182835",
        "ticket" : "777478415",
        "DepartureId" : "6733",
        "ArrivalId" : "6623",
        "StartVoyageDate" : "2014-11-12",
        "EndVoyageDate" : "2014-11-21",
        "TicketClass" : "0",
        "Adult" : "2",
        "HotelId" : "182835",
        "TicketId" : "777478415",
        "AddFilter" : "true"
    ]
    
    init(name: String?){
        println(name)
        
        Alamofire.request(.GET, "http://api.test.inna.ru/api/v1", parameters: parameters)
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
        }
        
        
    }

}