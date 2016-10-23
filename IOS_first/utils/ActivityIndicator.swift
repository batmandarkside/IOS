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
    fileprivate enum Size: String {
        case Big = "Big"
        case Medium = "Medium"
        case Mini = "Mini"
        func getSize() -> CGRect {
            switch self {
            case .Big:
                return CGRect(x: 0, y: 0, width: 80, height: 80)
            case .Medium:
                return CGRect(x: 0, y: 0, width: 40, height: 40)
            case .Mini:
                return CGRect(x: 0, y: 0, width: 20, height: 20)
            }
        }
    }
    
    fileprivate enum IndicatorFrame: String {
        case Big = "Big"
        case Medium = "Medium"
        case Mini = "Mini"
        func getSize() -> CGRect {
            switch self {
            case .Big:
                return CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
            case .Medium:
                return CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0);
            case .Mini:
                return CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0);
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
    
    fileprivate func createIndicator(_ uiView: UIView, sizeIndicator: String!,  styleIndicator: UIActivityIndicatorViewStyle!) {
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
        loadingView.center = uiView.convert(CGPoint(x: 50, y: 50), to: nil)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = activityIndicatorFrameSize!
        if(styleIndicator != nil){
            activityIndicator.activityIndicatorViewStyle = styleIndicator!
        } else {
            loadingView.backgroundColor = UIColorFromHex(0x444444, alpha: 0.7)
            activityIndicator.activityIndicatorViewStyle = .white
        }
        
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    
    func show(_ uiView: UIView, sizeIndicator: String, styleIndicator: UIActivityIndicatorViewStyle!) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : styleIndicator)
    }
    func show(_ uiView: UIView, styleIndicator: UIActivityIndicatorViewStyle!) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : styleIndicator)
    }
    func show(_ uiView: UIView, sizeIndicator: String) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : nil)
    }
    func show(_ uiView: UIView) {
        self.createIndicator(uiView, sizeIndicator: "Medium", styleIndicator : nil)
    }
    
    /*
    Hide activity indicator
    Actually remove activity indicator from its super view
    
    @param uiView - remove activity indicator from this view
    */
    func hide(_ uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    /*
    Define UIColor from hex value
    
    @param rgbValue - hex color value
    @param alpha - transparency level
    */
    func UIColorFromHex(_ rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}


struct PagingSpinner {
    fileprivate static let pagingSpinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    fileprivate static var parentView = UITableView()
    
    static func appendSpinner(_ view : UITableView) {
        self.parentView = view;
        self.pagingSpinner.color = UIColor(red: 22.0/255.0, green: 106.0/255.0, blue: 176.0/255.0, alpha: 1.0)
        self.pagingSpinner.hidesWhenStopped = true
        //self.pagingSpinner.backgroundColor = UIColor(red: 22.0/255.0, green: 106.0/255.0, blue: 176.0/255.0, alpha: 1.0)
		self.pagingSpinner.bounds.size.height = 50.0
        view.tableFooterView = self.pagingSpinner;
    }
    
    static func show() {
        //self.parentView.bounds = CGRectMake(0, 0, 0, 0)
        self.pagingSpinner.startAnimating()
    }
    
    static func hide() {
        self.pagingSpinner.stopAnimating()
    }

}
