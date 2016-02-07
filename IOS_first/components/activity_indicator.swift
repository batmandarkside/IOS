//
//  ActivityIndicator.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/4/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit

/** 
Индикатор загрузки данных с сервера
По дефолту - среднего размера : CGRect
*/
class ActivityIndicator {

    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // размер прелоадера
    private enum Size: String {
        case Big = "Big"
        case Medium = "Medium"
        case Mini = "Mini"
        func getSize() -> CGRect {
            switch self {
            case .Big:
                return CGRectMake(0, 0, 80, 80)
            case .Medium:
                return CGRectMake(0, 0, 40, 40)
            case .Mini:
                return CGRectMake(0, 0, 20, 20)
            }
        }
    }
    
    private enum IndicatorFrame: String {
        case Big = "Big"
        case Medium = "Medium"
        case Mini = "Mini"
        func getSize() -> CGRect {
            switch self {
            case .Big:
                return CGRectMake(0.0, 0.0, 40.0, 40.0)
            case .Medium:
                return CGRectMake(0.0, 0.0, 30.0, 30.0);
            case .Mini:
                return CGRectMake(0.0, 0.0, 20.0, 20.0);
            }
        }
    }

    
    
    
    //Gray
    //White
    //WhiteLarge
    
    /*
    Show customized activity indicator,
    actually add activity indicator to passing view
    
    @param uiView - add activity indicator to this view
    */
    
    private func createIndicator(uiView: UIView, sizeIndicator: String!,  styleIndicator: UIActivityIndicatorViewStyle!) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColorFromHex(0xffffff, alpha: 0.6)
        
        var loadingViewFrameSize = Size(rawValue: "Medium")?.getSize()
        var activityIndicatorFrameSize = IndicatorFrame(rawValue: "Medium")?.getSize()
        
        if(sizeIndicator != nil) {
            loadingViewFrameSize = Size(rawValue: sizeIndicator)?.getSize()
            activityIndicatorFrameSize = IndicatorFrame(rawValue: sizeIndicator)?.getSize()
        }
        
        
        loadingView.frame = loadingViewFrameSize!
        loadingView.center = uiView.convertPoint(CGPointMake(50, 50), toView: nil)
        loadingView.backgroundColor = UIColorFromHex(0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = activityIndicatorFrameSize!
        if(styleIndicator != nil){
            activityIndicator.activityIndicatorViewStyle = styleIndicator!
        } else {
            activityIndicator.activityIndicatorViewStyle = .White
        }
        
        activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    
    func showActivityIndicator(uiView: UIView, sizeIndicator: String, styleIndicator: UIActivityIndicatorViewStyle!) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : styleIndicator)
    }
    func showActivityIndicator(uiView: UIView, styleIndicator: UIActivityIndicatorViewStyle!) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : styleIndicator)
    }
    func showActivityIndicator(uiView: UIView, sizeIndicator: String) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : nil)
    }
    func showActivityIndicator(uiView: UIView) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : nil)
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
