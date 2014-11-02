//
//  ModelHotel.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/1/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation

class ModelHotel {
    
    var rowHotelData: [String: AnyObject] = [:]
    
    init(data: [String: AnyObject]){
        
        if !data.isEmpty {
            rowHotelData = data
        } else {
            println("HOTEL is EMPTY")

        }
    }
    
    func getHotelId(id: Int) -> [String:AnyObject]{
        
        //if(rowHotelData["HotelId"] == id){
        //    return rowHotelData
        //}
        
        return rowHotelData
    }
    
    func getHotelName(){
        
    }
}