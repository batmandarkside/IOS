//
//  modelHotel.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/1/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import SwiftyJSON


/** Класс коллекции отелей */
class CollectionHotels  {
    
    // содержит коллекцию моделей отелей
    private var modelHotel: [ModelHotel] = []
    private var hotelDataCollection: Array<JSON> = []
    
    
    
    
    // получаем список отелей
    func fetch(resolve:(()->()), reject:(()->())) {
        print("START LOAD DATA")
        
        ServicesDP.getHotels(
            hotelSuccess: {(data: AnyObject) in
                print("SUCCESS LOAD DATA")
                var responseJSON = JSON(data)
                self.hotelDataCollection = responseJSON["Hotels"].arrayValue            
                
                if(!self.hotelDataCollection.isEmpty) {
                    self.fillCollectionHotels()
                    resolve()
                } else {
                    reject()
                }            
            },
            hotelError: {
                reject()
            },
            complete : {

            }
        )    
    }
    
    func getCollection() -> Array<JSON>{
      return self.hotelDataCollection
    }
    
    func getCollectionModel() -> Array<ModelHotel>{
        return self.modelHotel
    }
    
    /**
    * Поиск отеля в коллекции¡™
    *
    */

    /*
    func getHotelId(id: Int) -> ModelHotel?{
        
        var returnModelHotel: ModelHotel?
        
        for modelHotelFind in modelHotel {
            var rawHotel = modelHotelFind.getHotelId(id)
            
            if(!rawHotel.isEmpty){
                returnModelHotel = modelHotelFind
                break
            } else {
                print("DO NOT FOUND HOTEL")
            }
        }
        
        return returnModelHotel?
    }*/

    
    /** 
    * Заполнить меделями коллекцию 
    *
    */
    private func fillCollectionHotels(){
        for hotel in self.hotelDataCollection {        
            let newModelHotel = ModelHotel(data: hotel)
            modelHotel.append(newModelHotel)
        }
    }
}