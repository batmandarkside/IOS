//
//  PopoverViewController.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/9/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DKPopoverViewController: UIViewController {
    
    var selectDate: NSDate!

    @IBAction func dateSelectDone(sender: UIBarButtonItem) {
        println("Cancel Select")
    }
    
    @IBAction func dateSelectCancel(sender: UIBarButtonItem) {
        println("Done Select")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //self.navigationItem.leftBarButtonItem
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    deinit {
            NSLog("Deinit - DKPopoverViewController")
    }
}
