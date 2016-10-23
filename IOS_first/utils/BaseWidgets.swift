//
//  BaseWidgets.swift
//  IOS_first
//
//  Created by dmitry on 19/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//
//	Базовый класс для создания реиспольземых компонентов
//
//
//

import UIKit

class BaseWidgets: UIView {

    var view : UIView!
	var nibName : String = ""
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func setup () {
        self.view = self.loadViewFromNib()
        self.view.frame = bounds
        self.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(self.view)
    }
    
    func loadViewFromNib () -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }

}
