//
//  MenuController.swift
//  IOS_first
//
//  Created by dmitry on 16/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation

class IndexScreen : UIViewController {
    //@IBOutlet weak var Open: UIBarButtonItem!
    override func viewDidLoad() {
        //Open.target = self.revealViewController()
        //Open.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}