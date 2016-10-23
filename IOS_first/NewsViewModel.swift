//
//  NewsViewModel.swift
//  IOS_first
//
//  Created by dmitry on 11/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift
import RxCocoa

class NewsViewModel: NSObject  {
    
    var newsModelObservable: Observable<NewsModel>?
    
    // If some process in progress
    var indicator: Observable<Bool>?
    var test : String = ""
	
    override init(){
        super.init()
        
        newsModelObservable = self.getNews()
            .map { _model in
            	return _model
        	}
        	.catchError { error in
                return Observable.error(error)
            }
            .shareReplay(1)

    }
    
    
    // create observer
    func getNews() -> Observable<NewsModel>{
        return Observable.create { observer in
	        ServicesNews.getNews()
                .then { body -> Void in
                    print("view model call")
                    let _model = Mapper<NewsModel>().map(body)!
                    observer.on(.Next(_model))
                    observer.on(.Completed)
            	}
            	.error { err  in
                    observer.on(.Error(err))
            	}
            
            return AnonymousDisposable {
                
            }
        }
    }
    
    func onEndReached (){
    }
    
}
