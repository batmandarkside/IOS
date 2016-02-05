//
//  news_model.swift
//  IOS_first
//
//  Created by dmitry on 05/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import ObjectMapper



class NewsModel : Mappable {
    
    var count: Int?
    var items: [NewsModelItem]?
    var page: [String : AnyObject] = [:]
    var request: [String : AnyObject] = [:]
    
    
    required init?(_ map: Map) {
        mapping(map)
    }
    
    
    // Mappable
    func mapping(map: Map) {
        count    <- map["count"]
        items    <- map["items"]
        page     <- map["page"]
        request  <- map["request"]
    }
}

class NewsModelItem : Mappable {
    
    var age: [String : AnyObject] = [:]
    var announce: String = ""
    var content_type: String = ""
    var feed: String = ""
    var id: Int?
    var link: String = ""
    var main_image: [MainImage]?
    var main_tag: [String : AnyObject] = [:]
    var media: [String : AnyObject] = [:]
    var original_author: String = ""
    var properties: String = ""
    var pub_date: Int?
    var related_api_urls: [String : AnyObject] = [:]
    var seo: [String : AnyObject] = [:]
    var slug: String = ""
    var tags: [Tags]?
    var text: String = ""
    var title: String = ""
    
    
    required init?(_ map: Map) {

    }
    
    
    // Mappable
    func mapping(map: Map) {
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

class MainImage: Mappable {
    var description: String = ""
    var image_url: String = ""
    var image_url_template: String = ""
    var license: String = ""
    var title: String = ""
    
    required init?(_ map: Map) {
        
    }
    
    func getImage() -> String {
        //if self.image_url.size
        return self.image_url
    }
    
    // Mappable
    func mapping(map: Map) {
        description 		<- map["description"]
        image_url 			<- map["image_url"]
        image_url_template	<- map["image_url_template"]
        license				<- map["license"]
        license				<- map["license"]
    }

}

class Tags: Mappable {
    var slug: String = ""
    var title: String = ""
    
    required init?(_ map: Map) {

    }
    
    // Mappable
    func mapping(map: Map) {
        slug    <- map["slug"]
        title    <- map["title"]
    }
}