//
//  news_model.swift
//  IOS_first
//
//  Created by dmitry on 05/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsModel : NSObject, Mappable {
    
    var count: Int = 0
    var items: [NewsModelItemMapper]?
    var page: [String : AnyObject] = [
        "next" : "" as AnyObject,
        "page_size": 0 as AnyObject,
        "prev": "" as AnyObject
    ]
    var request: [String : AnyObject] = [:]
    

    required init?(_ map: Map) {}
    
    
    func getPageNext () -> String {
        return self.page["next"] as! String
    }
    
    
    // Mappable
    func mapping(_ map: Map) {
        count    <- map["count"]
        items    <- map["items"]
        page     <- map["page"]
        request  <- map["request"]
    }
}

class NewsModelItemMapper : NSObject,  Mappable {
    
    var age: [String : AnyObject] = [:]
    var announce: String = ""
    var content_type: String = ""
    var feed: String = ""
    var id: Int?
    var link: String = ""
    var main_image: ImageMapper?
    var main_tag: [String : AnyObject] = [:]
    var media: [String : AnyObject] = [:]
    var original_author: String = ""
    var properties: String = ""
    var pub_date: Int?
    var related_api_urls: [String : AnyObject] = [:]
    var seo: [String : AnyObject] = [:]
    var slug: String = ""
    var tags: [TagsNewsMapper]?
    var text: String = ""
    var title: String = ""
    
    
    required init?(_ map: Map) {}
    
    func getTitle() -> String {
        return self.title
    }
    
    func getMainTagTitle() -> String {
        var mainTag = ""
        if !self.main_tag.isEmpty {
            mainTag = self.main_tag["title"]! as! String
        }
        return mainTag
    }
    
    func getMainImage() -> URL {
        if (self.main_image != nil){
	        return (self.main_image?.getImage())!
        } else {
            return URL(string : "")!
        }
    }
    
    func getNoImage() -> String {
        return (self.main_image?.getNoImage())!
    }

    func getImageTemplate() -> String {
        return self.title
    }
    
    // Mappable
    func mapping(_ map: Map) {
        age 				<- map["age"]
        announce 			<- map["announce"]
        content_type		<- map["content_type"]
        feed				<- map["feed"]
        id					<- map["id"]
        link				<- map["link"]
        main_image			<- map["main_image"]
        main_tag			<- map["main_tag"]
        media				<- map["media"]
        original_author 	<- map["original_author"]
        properties			<- map["properties"]
        pub_date			<- map["pub_date"]
        related_api_urls	<- map["related_api_urls"]
        seo					<- map["seo"]
        slug				<- map["slug"]
        tags				<- map["tags"]
        text				<- map["text"]
        title				<- map["title"]
    }
}

class ImageMapper:  Mappable {
    var description: String = ""
    var image_url: String = ""
    var image_url_template: String = ""
    var license: String = ""
    var title: String = ""
    
    required init?(_ map: Map) {}
    
    func getImage() -> URL {
        return URL(string : self.image_url)!
    }
    
    
    func getNoImage() -> String {
        return "no_photo_hotel.png"
    }
    
    // Mappable
    func mapping(_ map: Map) {
        description 		<- map["description"]
        image_url 			<- map["image_url"]
        image_url_template	<- map["image_url_template"]
        license				<- map["license"]
        license				<- map["license"]
    }
    
}

class TagsNewsMapper: NSObject, Mappable {
    var slug: String = ""
    var title: String = ""
    
    required init?(_ map: Map) {}
    
    // Mappable
    func mapping(_ map: Map) {
        slug    <- map["slug"]
        title    <- map["title"]
    }
}
