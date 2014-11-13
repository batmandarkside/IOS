//
//  SearchFormController.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/8/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DKSearchFormController: UIViewController, DKDatePickerViewProtocol {

	
    var dateDatePicker: NSDate!
    @IBOutlet weak var popoverAdd: UIBarButtonItem!
	@IBOutlet weak var dateThere: UIButton!
	@IBOutlet weak var dateBack: UIButton!
	@IBOutlet var ViewDatePickerComponent: DKDatePickerView!
	private var senderButton : UIButton!
	
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

    
	@IBAction func actionDateThere(sender: UIButton) {
		self.senderButton = sender
		ViewDatePickerComponent.showDatePicker(sender)
	}
	
	@IBAction func actionDateBack(sender: UIButton) {
		self.senderButton = sender
		ViewDatePickerComponent.showDatePicker(sender)
	}
	
	
    @IBAction func popoverAddAction(sender: UIBarButtonItem) {
        
    }
	
	func datePickerChanged(date: String) {
		if(self.senderButton != nil){
			self.senderButton.setTitle(date, forState: nil)
		}
	}
	
    /*override func viewDidLayoutSubviews() {
        println("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        println("viewWillLayoutSubviews")
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
		
		ViewDatePickerComponent.testDelegate = self
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

        //let nvk: UINavigationController = segue.destinationViewController as UINavigationController
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
