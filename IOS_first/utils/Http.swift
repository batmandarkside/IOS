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

class Result<T: Mappable>: Mappable {
    var result: T?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        result <- map["result"]
    }
}


struct Http {
    
    static let baseUrl: String = "http://family.rambler.ru/"
    static let baseUrlApi: String = "api/v1/"
    
    
    /*  */
    static func get(urlParam: String, params: [String: AnyObject]?) -> Promise<AnyObject>{
        
        let URL: String = baseUrl + baseUrlApi + urlParam;
        
        return Promise { fulfill, reject in
            Alamofire.request(.GET, URL, parameters: params)
                .responseJSON { response in
                    switch response.result {
                    case .Success(let JSON):
                        //let result = Mapper<Result<User>>().map(JSON)
                        fulfill(JSON)
                    case .Failure(let error):
                        reject(error)
                    }
            }
        }
    }
    
    static func post(urlParam: String, params: [String: AnyObject]?) -> Promise<AnyObject>{
        
        let URL: String = baseUrl + baseUrlApi + urlParam;
        
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