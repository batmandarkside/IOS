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
    
    private var rawHotelData: JSON!
    //private let manager: AFImageRequestOperation
    
    init(data: JSON){
        let d = data.dictionaryValue
        if !d.isEmpty {
            self.rawHotelData = data
        } else {
            print("HOTEL is EMPTY")

        }
    }
    
    func setData(data: [String: JSON]){
        
    }
	
	func getImagePreview() -> String{
		return self.rawHotelData["HotelPhoto70"].stringValue
	}
	
	func getNoImage() -> UIImage? {
		return UIImage(named: "no_photo_hotel.png")
	}
	
	func getImageUrl() -> NSURL {
		return NSURL(string: self.getImagePreview())!
	}
	
    func getImage(success:(()->()), fail:(()->())){
		
    }
	
    
	
    func getName() -> String {
        return rawHotelData["HotelName"].stringValue
    }
	
    func getHotelId(id: Int) -> JSON{
        if(self.rawHotelData["HotelId"].intValue == id){
            return self.rawHotelData
        } else {
            return [:]
        }
    }
}