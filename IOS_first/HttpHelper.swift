//
//  HttpHelper.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/2/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


/*
    Небольшая обертка над Alamofire
    get
    post
    download
    upload
*/
struct HttpHelper {
    
    static let baseUrl: String = "http://www.inna.ru/"
    static let baseUrlApi: String = "api/v1/"

    
    /*  */
    static func get(urlParam: String, params : [String: AnyObject]?,
        callbackSuccess: (data: NSDictionary)->(), callbackError: ()->(), complete: ()->()){
    
        let URL: String = baseUrl + baseUrlApi + urlParam
        
        Alamofire.request(.GET, URL, parameters: params)
            .responseJSON { (request, response, data, error) in
                
                if(error != nil) {
                    println(error, "error")
                    println(request, "request")
                    callbackError()
                } else {                    
                    callbackSuccess(data: (data as NSDictionary))
                }
                
                complete()
        }
        
    }
    
    static func post(urlParam: String, params : [String: AnyObject]?,
        hotelSuccess: (data: NSDictionary)->(), hotelError: ()->(), complete: ()->()){
        
        let URL: String = baseUrl + baseUrlApi + urlParam
        
        Alamofire.request(.POST, URL, parameters: params)
            .responseJSON { (request, response, data, error) in
                
                
                if(error != nil) {
                    println(error, "error")
                    println(request, "request")
                    hotelError()
                } else {
                    hotelSuccess(data: (data as NSDictionary))
                }
                
                complete()
        }
    }
    
    static func download(params : [String: AnyObject]?, hotelSuccess: (data: NSDictionary)->(), hotelError: ()->(), complete: ()->()){
        
        Alamofire.request(.GET, "http://www.lh.ios.inna.ru/api/v1/Packages/SearchHotels", parameters: params)
            .responseJSON { (request, response, data, error) in
                
                
                if(error != nil) {
                    println(error, "error")
                    println(request, "request")
                    hotelError()
                } else {
                    hotelSuccess(data: (data as NSDictionary))
                }
                
                complete()
        }
        
    }
    
    static func upload(params : [String: AnyObject]?, hotelSuccess: (data: NSDictionary)->(), hotelError: ()->(), complete: ()->()){
        
        Alamofire.request(.GET, "http://www.lh.ios.inna.ru/api/v1/Packages/SearchHotels", parameters: params)
            .responseJSON { (request, response, data, error) in
                
                
                if(error != nil) {
                    println(error, "error")
                    println(request, "request")
                    hotelError()
                } else {
                    hotelSuccess(data: (data as NSDictionary))
                }
                
                complete()
        }
        
    }
}