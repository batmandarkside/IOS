//
//  Utils.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/1/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerUtils {
    

}

struct Utils {
    
    /** setTimeout */
    static func TimeOut(timeOut: Int64, resolve: () -> ()){
        var delta: Int64 = timeOut * Int64(NSEC_PER_SEC)
        var time = dispatch_time(DISPATCH_TIME_NOW, delta)
        
        dispatch_after(time, dispatch_get_main_queue(), {
            resolve()
        });
    }
    
    /** setInterval */
    class Timer {
        
        var timer = NSTimer()
        var handler: (Int) -> ()
        
        let duration: Int
        var elapsedTime: Int = 0
        
        init(duration: Int, handler: (Int) -> ()) {
            self.duration = duration
            self.handler = handler
        }

        func start() {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                target: self,
                selector: Selector("tick"),
                userInfo: nil,
                repeats: true)
        }
        
        func stop() {
            timer.invalidate()
        }
        
        @objc func tick() {
            self.elapsedTime++
            
            self.handler(elapsedTime)
            
            if self.elapsedTime == self.duration {
                self.stop()
            }
        }
        
        deinit {
            self.timer.invalidate()
        }

    }
}