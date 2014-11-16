//
//  PopoverViewController.swift
//  IOS_first
//
//  Created by дмитрий кузнецов on 11/9/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DKPopoverViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    weak var popoverDelegate: DKPopoverViewControllerDelegate!
    var testColor: UIColor!
    @IBOutlet weak var componentPickerView: UIPickerView!
    @IBOutlet var collectionLabelPassenger: [UILabel]!
    
    
    var collectionLabelPassengerValue : [String: Int] = [
        "Adult": 1,
        "Children": 0,
        "Infant": 0
    ]
    
    @IBAction func dateSelectDone(sender: UIBarButtonItem) {
        self.postNotification()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func dateSelectCancel(sender: UIBarButtonItem) {
        self.postNotification()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    var peopleArr: [Int:Array<Int>] = [
        0: [1, 2, 3, 4, 5, 6, 7, 8],
        1: [0, 1, 2, 3, 4, 5, 6, 7, 8],
        2: [0, 1, 2, 3, 4, 5, 6, 7, 8]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.componentPickerView.delegate = self
        self.componentPickerView.dataSource = self
        
        //self.navigationItem.leftBarButtonItem
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Получаем данные через popoverDelegate из DKSearchFormController
        if(popoverDelegate != nil) {
            self.collectionLabelPassengerValue = popoverDelegate.getPassengersData() as Dictionary<String, Int>
            
            var valueAdult: Int = self.collectionLabelPassengerValue["Adult"]!
            var valueChildren: Int = self.collectionLabelPassengerValue["Children"]!
            var valueInfant: Int = self.collectionLabelPassengerValue["Infant"]!
            
            self.componentPickerView.selectRow(valueAdult - 1, inComponent: 0, animated: true)
            self.componentPickerView.selectRow(valueChildren, inComponent: 1, animated: true)
            self.componentPickerView.selectRow(valueInfant, inComponent: 2, animated: true)
            
            self.setTitleCountPeople(0, row: valueAdult)
            self.setTitleCountPeople(1, row: valueChildren)
            self.setTitleCountPeople(2, row: valueInfant)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        let Label: UILabel = UILabel(frame: CGRectMake(40, 0, 70, 30))
        Label.textAlignment = .Left
        Label.adjustsFontSizeToFitWidth = true
        Label.font = UIFont.systemFontOfSize(25)
        
        var compArr: Array<Int> = self.peopleArr[component]!
        Label.text = NSString(format: "%d", compArr[row])
        
        return Label
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var rowIndex = row
        if(component == 0) {
            rowIndex = (row + 1)
        }
        
        //println(NSString(format: "formar row %d", rowIndex))
        self.setTitleCountPeople(component, row: rowIndex)
        self.insertCollectionPassengerValue(component, row: rowIndex)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var compArr: Array<Int> = self.peopleArr[component]!
        return compArr.count
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 35
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
   
    
    func setTitleCountPeople(component: Int, row: Int){
        let label: UILabel = self.collectionLabelPassenger[component]
        label.text = NSString( format: "%d", row)
    }
    
    
    // Собираем данные в коллекцию
    func insertCollectionPassengerValue(component: Int, row: Int){
        var associationName = ""
        switch(component){
            case 0:
                //println(NSString(format: "formar row set %d", row))
                associationName = "Adult"
            case 1:
                associationName = "Children"
            case 2:
                associationName = "Infant"
            default:
                associationName = ""
            
        }
        println(row)
        self.collectionLabelPassengerValue[associationName] = row
    }
    
    
    func postNotification(){
        NSNotificationCenter.defaultCenter().postNotificationName(
            DKNotification.PeopleChangeNotification,
            object: self.collectionLabelPassengerValue)
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
