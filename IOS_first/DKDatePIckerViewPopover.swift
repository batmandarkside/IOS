//
//  DKDatePIckerViewPopover.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/9/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DKDatePIckerViewPopover: UIView {

    weak var testButton : UIButton!
    weak var testView: UIView!
    weak var viewController: UIViewController!
    var datePicker: UIDatePicker!
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        println("drawRect")

        let addUIViewController: UIViewController = UIViewController()
        let navController: UINavigationController = UINavigationController(rootViewController: addUIViewController)
        self.addSubview(navController.view)
        
        var navItem = navController.navigationItem
        
        let barButtonItemDone: UIBarButtonItem = UIBarButtonItem(title: "ok", style: .Done,
            target: self, action: "popoverDone:")
        
        let barButtonItemCancel: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel,
            target: self, action: "popoverCancel:")
        
        
        navItem.rightBarButtonItem = barButtonItemDone
        navItem.leftBarButtonItem = barButtonItemCancel

        addUIViewController.view.frame = CGRectMake(0, 0, 300, 300)
        addUIViewController.view.backgroundColor = UIColor.redColor()
        
        self.datePicker = UIDatePicker()

        addUIViewController.view.addSubview(self.datePicker)
        
        self.viewController = addUIViewController
        
    }
    
    
    func showTestView(sender: UIButton){
        var log = NSStringFromCGRect(sender.frame)
        println(log)
        toggle()
    }
    
    func toggle(){
        self.viewController.view.hidden = (self.viewController.view.hidden) ? false : true
    }
    
    func popoverDone(sender : UIBarButtonItem){
        println("DONE")
    }
    
    func popoverCancel(sender : UIBarButtonItem){
        println("CANCEL")
    }
}
