//
//  SearchFormController.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/8/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DKSearchFormController: UIViewController {

    var dateDatePicker: NSDate!

    @IBOutlet weak var dateThere: UILabel!
    @IBOutlet weak var dateBack: UILabel!
    @IBOutlet weak var popoverAdd: UIBarButtonItem!
    
    
    // Способ показать поповер на iPhone
    @IBAction func showDkPopover(sender: UIButton) {
        let vc: UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PopoverCodeController") as UIViewController
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: vc)
        
        // если iPhone
        if(UIDevice.currentDevice().userInterfaceIdiom == .Phone){
            self.presentViewController(navigationController, animated: true, completion: {
            })
        }
    }

    
    @IBAction func popoverAddAction(sender: UIBarButtonItem) {
        
    }
    
    /*override func viewDidLayoutSubviews() {
        println("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        println("viewWillLayoutSubviews")
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("===viewWillAppear----")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func closeKeyboard(sender: UIBarButtonItem){

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)

        let nvk: UINavigationController = segue.destinationViewController as UINavigationController
        //let navDetailViewController: DKPopoverViewController = nvk.viewControllers
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
