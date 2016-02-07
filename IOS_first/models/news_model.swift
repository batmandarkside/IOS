//
//  news_model.swift
//  IOS_first
//
//  Created by dmitry on 05/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import SwiftyJSON



class NewsModel : BaseModel {
    
    override init(data: JSON) {
        super.init(data: data)
    }
    
    func getItem(index : Int) -> NewsModelItem {
        let items = self.getProps("items")
        let item = items[index]
        return NewsModelItem(data: item)
    }
}

class NewsModelItem : BaseModel {
    
    override init(data: JSON) {
        super.init(data: data)
    }
    
    func getMainImage() -> MainImage {
        let main_image = self.getProps("main_image")
        return MainImage(data : main_image)
    }
    
    
}

class MainImage : BaseModel {
    
    override init(data: JSON) {
        super.init(data: data)
    }
    
    func getMainImageUrl() -> String {
        return self.get("image_url")
    }
    
    func getImageTemplate() -> String {
        return ""
    }
    
    func loadImage() {
        
    }
}

class Tags : BaseModel {
    override init(data: JSON) {
        super.init(data: data)
    }
}