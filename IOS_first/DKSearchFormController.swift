//
//  SearchFormController.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/8/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DKSearchFormController: UIViewController, DKDatePickerViewProtocol, DKPopoverViewControllerDelegate {

	
    var dateDatePicker: NSDate!
    var collectionLabelPassengerValue : [String: Int] = [
        "Adult": 1,
        "Children": 0,
        "Infant": 0
    ]
    @IBOutlet weak var popoverAdd: UIBarButtonItem!
	@IBOutlet weak var dateThere: UIButton!
	@IBOutlet weak var dateBack: UIButton!
    @IBOutlet weak var labelPassenger: UILabel!
    
    @IBOutlet var ViewDatePickerComponent: DKDatePickerView!
	private var senderButton : UIButton!
	
    // Способ показать поповер на iPhone
    @IBAction func showDkPopover(sender: UIButton) {
        let vc: UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("PopoverViewController"))! as UIViewController
        
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
    
    
    @IBAction func actionSwitchDatBack(sender: UISwitch) {
        if(sender.on){
            self.dateBack.enabled = true
            self.dateBack.alpha = 1
        } else {
            self.dateBack.enabled = false
            self.dateBack.alpha = 0.3
            self.dateBack.setTitle(self.dateBack.currentTitle, forState: .Disabled)
        }
    }
    
	
    /**
     Метод делегата DKDatePickerViewProtocol
     Событие изменения DatePicker
    */
	func datePickerChanged(date: String) {
		if(self.senderButton != nil){
            let newLabel = NSString(format: "%@", date)
			self.senderButton.setTitle(newLabel as String, forState: .Normal)
		}
	}
    
    func getPassengersData() -> NSDictionary {
         return self.collectionLabelPassengerValue
    }
    
    func setlabelPassenger(){
        self.labelPassenger.text = NSString(format: "%d - %d - %d",
            self.collectionLabelPassengerValue["Adult"]!,
            self.collectionLabelPassengerValue["Children"]!,
            self.collectionLabelPassengerValue["Infant"]!) as String    
    }
	
    /*override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
		self.setlabelPassenger()
        
		ViewDatePickerComponent.datePickerDelegate = self
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeUserHandler:", name: DKNotification.PeopleChangeNotification, object: AnyObject?())
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("===viewWillAppear----")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Обработчик события - получаем данные от модального контроллера
    // Где выбрали количество пассажиров
    func changeUserHandler(notification: NSNotification){
        self.collectionLabelPassengerValue = notification.object as! Dictionary<String, Int>
        self.setlabelPassenger()
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)

        var nvk: UINavigationController = segue.destinationViewController as UINavigationController
        var navDetailViewController: DKPopoverViewController = nvk.viewControllers[0] as DKPopoverViewController
        navDetailViewController.popoverDelegate = self
    }*/
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
