//
//  SearchBarWidget.swift
//  IOS_first
//
//  Created by dmitry on 18/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import UIKit

@IBDesignable class SearchBarWidget:  UIView, UITextFieldDelegate, SearchInputProtocol {

    var view : UIView!
    var nibName : String = "SearchBarWidget"

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonSearch: UIButton!
    

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
        
        textField.placeholder = "test"
        textField.textAlignment = .Right
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
    
    
    
    @IBAction func startSearch(sender: AnyObject) {
        print(textField.text)
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print(textField.text)
        return true
    }
    
    
    func searchInputChanged(data: String) {
        print(data)
    }


}
