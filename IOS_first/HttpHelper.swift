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
	private static let manager = AFHTTPRequestOperationManager()

    
    /*  */
    static func get(urlParam: String, params : [String: AnyObject]?,
        callbackSuccess: (data: AnyObject)->(), callbackError: ()->(), complete: ()->()){
    
        let URL: String = baseUrl + baseUrlApi + urlParam
		self.manager.GET(URL,
			parameters: params,
			success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
				callbackSuccess(data: responseObject)
				complete()
			},
			failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
				println("Error: " + error.localizedDescription)
				callbackError()
				complete()
		})
    }
    
    static func post(urlParam: String, params : [String: AnyObject]?,
        callbackSuccess: (data: AnyObject)->(), callbackError: ()->(), complete: ()->()){
        
        let URL: String = baseUrl + baseUrlApi + urlParam
			
			self.manager.POST(URL,
				parameters: params,
				success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
					callbackSuccess(data: responseObject)
					complete()
				},
				failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
					println("Error: " + error.localizedDescription)
					callbackError()
					complete()
			})
        
	}
    
    static func download(urlParam: String, params : [String: AnyObject]?,
		callbackSuccess: (data: AnyObject)->(), callbackError: ()->(), complete: ()->()){
			
    }
    
    static func upload(params : [String: AnyObject]?, callbackSuccess: (data: AnyObject)->(), callbackError: ()->(), complete: ()->()){
        
    }
}