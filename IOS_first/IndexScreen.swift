//
//  MenuController.swift
//  IOS_first
//
//  Created by dmitry on 16/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation

class IndexScreen : UIViewController {
    @IBOutlet weak var openMenu: UIBarButtonItem!
    override func viewDidLoad() {
        openMenu.target = self.revealViewController()
        openMenu.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("prepareForSegue")
        
    }
}