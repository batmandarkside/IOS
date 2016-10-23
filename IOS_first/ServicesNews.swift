//
//  news.swift
//  IOS_first
//
//  Created by dmitry on 04/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON


struct ServicesNews {
    
    
    static func getNews (page : Int? = 1, rubr : String? = "") -> Promise<AnyObject>{
        let url = String(format: "api/v1/content/news.json?page=%d", page!)
        return Http.get(url, params: nil)
    }
    
    static func getNewsByUrl (url : String) -> Promise<AnyObject> {
        return Http.get(url, params: nil)
    }
    
    static func getNewsByRubric (){
        
    }
    
    static func getNewsId (id: Int){
        print(id)
    }

}
