//
//  testRAC.swift
//  IOS_first
//
//  Created by dmitry on 10/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import ReactiveCocoa


class testRAC  {
    
    init(){
        
        let testSignal : RACSignal = RACSignal.createSignal { (subscriber) -> RACDisposable! in
            var i = 0
            let Timer = Utils.Timer(duration: 1000, handler: { params -> Void in
                
                subscriber.sendNext(i++)
                
                if(i == 10){
                    subscriber.sendCompleted()
                }
            })
            
            //Timer.start()
            
            
            return nil
            }
            .finally { () -> Void in
                print("finally")
                //Timer.stop()
        }
        
        
        testSignal.doNext { (value) -> Void in
            print(value, "doNext")
        }
        testSignal.subscribeNext { (value) -> Void in
            print(value, "subscribeNext")
        }

    }
}