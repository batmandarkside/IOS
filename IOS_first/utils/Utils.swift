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
    static func TimeOut(_ timeOut: Double, resolve: @escaping () -> ()){
        let delta = timeOut * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delta)) / Double(NSEC_PER_SEC)
        
        DispatchQueue.main.asyncAfter(deadline: time, execute: {
            resolve()
        });
    }
    
    static func parseJson(_ data: Data, completionParse: (_ data : AnyObject)->()) {
        
    }
    
    /** setInterval */
    class Timer {
        
        var timer = Foundation.Timer()
        var handler: (Int) -> ()
        
        let duration: Int
        var elapsedTime: Int = 0
        
        init(duration: Int, handler: @escaping (Int) -> ()) {
            self.duration = duration
            self.handler = handler
        }

        func start() {
            self.timer = Foundation.Timer.scheduledTimer(timeInterval: 1.0,
                target: self,
                selector: #selector(Timer.tick),
                userInfo: nil,
                repeats: true)
        }
        
        func stop() {
            timer.invalidate()
        }
        
        @objc func tick() {
            self.elapsedTime += 1
            
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


struct console {
    static func log(_ text:Any) -> Void {
        print(text)
    }
}

