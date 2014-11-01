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
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    /*
    Show customized activity indicator,
    actually add activity indicator to passing view
    
    @param uiView - add activity indicator to this view
    */
    func showActivityIndicator(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRectMake(0, 0, 80, 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColorFromHex(0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    /*
    Hide activity indicator
    Actually remove activity indicator from its super view
    
    @param uiView - remove activity indicator from this view
    */
    func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    /*
    Define UIColor from hex value
    
    @param rgbValue - hex color value
    @param alpha - transparency level
    */
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}

struct Utils {
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
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