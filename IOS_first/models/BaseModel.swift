//
//  base_model.swift
//  IOS_first
//
//  Created by Dmitry Kuznetsov on 2/7/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import SwiftyJSON

class BaseModel {
    private var jsonData: JSON!
    
    init(data: JSON) {
        let d = data.dictionaryValue
        if !d.isEmpty {
            self.jsonData = data
        } else {
            print("is EMPTY DATA")
            
        }
    }
    
    //
    func getData() -> JSON{
        return self.jsonData
    }
    
    //
    func getProps(props : String) -> JSON {
        print(self.jsonData[props])
        if self.jsonData[props] != nil {
            return self.jsonData[props]
        } else {
            return JSON([])
        }
    }
    
    func get(props : String) -> String {
        return self.jsonData[props].stringValue
    }
    
    //
    func setProps(props : String, value : AnyObject){
        if self.jsonData[props] != nil {
           self.jsonData[props] = JSON(value)
        }
    }
    
    func getRawData() -> [String: JSON]{
        return self.jsonData.dictionaryValue
    }
}
