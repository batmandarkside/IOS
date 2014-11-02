//
//  modelHotel.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/1/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation


/** Класс коллекции отелей */
class ModelHotelCollection {
    
    // содержит коллекцию моделей отелей
    var modelHotel: [ModelHotel] = []
    var rowHotelDataCollection: [[String: AnyObject]] = [[:]]

    init(data: [[String: AnyObject]]){
        
        if !data.isEmpty {
            self.rowHotelDataCollection = data
            self.fillCollectionModelHotel()
        } else {
            println("EMPTY COLLECTION")
        }
        
        
    }
    
    
    /**
    * Поиск отеля в коллекции¡™
    *
    */
    func getHotelId(id: Int) -> ModelHotel?{
        
        var returnModelHotel: ModelHotel?
        
        for modelHotelFind in modelHotel {
            var rawHotel = modelHotelFind.getHotelId(id)
            
            if(!rawHotel.isEmpty){
                returnModelHotel = modelHotelFind
                break
            } else {
                println("DO NOT FOUND HOTEL")
            }
        }
        
        return returnModelHotel?
    }
    
    /** 
    * Заполнить меделями коллекцию 
    *
    */
    private func fillCollectionModelHotel(){
        for hotel in self.rowHotelDataCollection {
            modelHotel.append(ModelHotel(data: hotel))
        }
    }
}