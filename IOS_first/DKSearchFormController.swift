//
//  SearchFormController.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/8/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DKSearchFormController: UIViewController, DKDatePickerViewProtocol, DKPopoverViewControllerDelegate {

	
    var dateDatePicker: Date!
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
	fileprivate var senderButton : UIButton!
	
    // Способ показать поповер на iPhone
    @IBAction func showDkPopover(_ sender: UIButton) {
        let vc: UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "PopoverViewController"))! as UIViewController
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: vc)
        
        // если iPhone
        if(UIDevice.current.userInterfaceIdiom == .phone){
            self.present(navigationController, animated: true, completion: {
            })
        }
    }

    
	@IBAction func actionDateThere(_ sender: UIButton) {
		self.senderButton = sender
		ViewDatePickerComponent.showDatePicker(sender)
	}
	
	@IBAction func actionDateBack(_ sender: UIButton) {
		self.senderButton = sender
		ViewDatePickerComponent.showDatePicker(sender)
	}
	
	
    @IBAction func popoverAddAction(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func actionSwitchDatBack(_ sender: UISwitch) {
        if(sender.isOn){
            self.dateBack.isEnabled = true
            self.dateBack.alpha = 1
        } else {
            self.dateBack.isEnabled = false
            self.dateBack.alpha = 0.3
            self.dateBack.setTitle(self.dateBack.currentTitle, for: .disabled)
        }
    }
    
	
    /**
     Метод делегата DKDatePickerViewProtocol
     Событие изменения DatePicker
    */
	func datePickerChanged(_ date: String) {
		if(self.senderButton != nil){
            let newLabel = NSString(format: "%@", date)
			self.senderButton.setTitle(newLabel as String, for: UIControlState())
		}
	}
    
    func getPassengersData() -> NSDictionary {
         return self.collectionLabelPassengerValue as NSDictionary
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
    
        NotificationCenter.default.addObserver(self, selector: "changeUserHandler:", name: NSNotification.Name(rawValue: DKNotification.PeopleChangeNotification), object: AnyObject?())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("===viewWillAppear----")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Обработчик события - получаем данные от модального контроллера
    // Где выбрали количество пассажиров
    func changeUserHandler(_ notification: Notification){
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
        NotificationCenter.default.removeObserver(self)
    }
}
