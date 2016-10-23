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

public enum HttpError: Error {
    case notDetermined
    case restricted
    case denied
    
    public var localizedDescription: String {
        switch self {
        case .notDetermined:
            return "Access NotDetermined"
        case .restricted:
            return "Restricted"
        case .denied:
            return "Denied"
        }
    }
}

struct Http {
    
    fileprivate static let urlTempl = "http://family.rambler.ru/%@"
    
    
    /*  */
    static func get(_ urlParam: String, params: [String: AnyObject]?) -> Promise<AnyObject>{
        
        
        let URL: String =  String(format: urlTempl, urlParam)
        
        return Promise<AnyObject> { fulfill, reject in
            Alamofire.request(.GET, URL, parameters: params)
                .responseJSON { response in
                    switch response.result {
                    case .success(let JSON):
                        fulfill(JSON)
                    case .failure(let error):
						reject(error)
                    }
            }
        }
    }
    
    static func post(_ urlParam: String, params: [String: AnyObject]?) -> Promise<AnyObject>{
        let URL: String =  String(format: urlTempl, urlParam)
        return Promise { fulfill, reject in
            Alamofire.request(.POST, URL, parameters: params)
                .responseJSON { response in
                    switch response.result {
                    case .success(let JSON):
                        fulfill(JSON)
                    case .failure(let error):
                        reject(error)
                    }
            }
        }
    }
}
