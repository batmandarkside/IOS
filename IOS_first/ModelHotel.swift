//
//  ModelHotel.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/1/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class ModelHotel {
    
    private var rawHotelData: [String: JSON]!
    
    init(data: [String: JSON]){
        
        if !data.isEmpty {
            self.rawHotelData = data
        } else {
            println("HOTEL is EMPTY")

        }
    }
    
    func setData(data: [String: JSON]){
        
    }
    
    /*
    func loadAsyncImage(){        
        dispatch_async(dispatch_get_main_queue(), {
            let iurl: String = self.rawHotelData["HotelPhoto70"]!.stringValue
            let image_url = NSURL(string: iurl) //NSURL(fileURLWithPath: iurl)
            let image_data = NSData(contentsOfURL: image_url!)
            let image = UIImage(data: image_data!)
        })
    }*/
    
    /*
    func getName() -> String {
        return self.rawHotelData["HotelName"]!.stringValue
    }*/
    
    /*
    func getHotelId(id: Int) -> [String:JSON]{
        
        if(self.rowHotelData["HotelId"].intValue == id){
            return rowHotelData
        } else {
            return [:]
        }
    }*/
    
    func getHotelName(){
        
    }
}