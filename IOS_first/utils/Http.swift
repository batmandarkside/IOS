//
//  ht.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/2/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import ObjectMapper

public enum HttpError: ErrorType {
    case NotDetermined
    case Restricted
    case Denied
    
    public var localizedDescription: String {
        switch self {
        case .NotDetermined:
            return "Access NotDetermined"
        case .Restricted:
            return "Restricted"
        case .Denied:
            return "Denied"
        }
    }
}

struct Http {
    
    private static let urlTempl = "http://family.rambler.ru/%@"
    
    
    /*  */
    static func get(urlParam: String, params: [String: AnyObject]?) -> Promise<AnyObject>{
        
        
        let URL: String =  String(format: urlTempl, urlParam)
        
        return Promise<AnyObject> { fulfill, reject in
            Alamofire.request(.GET, URL, parameters: params)
                .responseJSON { response in
                    switch response.result {
                    case .Success(let JSON):
                        fulfill(JSON)
                    case .Failure(let error):
						reject(error)
                    }
            }
        }
    }
    
    static func post(urlParam: String, params: [String: AnyObject]?) -> Promise<AnyObject>{
        let URL: String =  String(format: urlTempl, urlParam)
        return Promise { fulfill, reject in
            Alamofire.request(.POST, URL, parameters: params)
                .responseJSON { response in
                    switch response.result {
                    case .Success(let JSON):
                        fulfill(JSON)
                    case .Failure(let error):
                        reject(error)
                    }
            }
        }
    }
}