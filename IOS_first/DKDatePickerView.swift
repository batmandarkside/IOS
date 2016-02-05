//
//  DKDatePickerView.swift
//

import UIKit

class DKDatePickerView: UIView {

	
	@IBOutlet weak var componentDatePicker: UIDatePicker!
	@IBOutlet weak var componentDatePickerViewWrapper: UIView!
	@IBOutlet weak var labelDatePicker: UILabel!
	
    weak var datePickerDelegate: DKDatePickerViewProtocol!
    private var dateDatePicker: NSDate!
	
	
	@IBAction func actionDone(sender: UIButton) {
        if(self.dateDatePicker == nil) {
            self.dateDatePicker = componentDatePicker.date
        }
        self.sendDate()
        self.viewHidden(true)
	}
	
	@IBAction func actionCancel(sender: UIButton) {
		self.viewHidden(true)
	}
	
	
	@IBAction func actionValueChangedDatePicker(sender: UIDatePicker) {
		self.dateDatePicker = sender.date
	}

	// Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code

        self.minMaxDateCalendar()

        componentDatePickerViewWrapper.bounds = CGRectMake(0, -200, 320, 201)
        componentDatePickerViewWrapper.alpha = 0
        componentDatePickerViewWrapper.hidden = true
    }
    
    /**
     Минимально и максимально возможный выбор даты
    */
    func minMaxDateCalendar(){
        //let Calendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        //let dateNow : NSDate = NSDate()
        //let Components: NSDateComponents = NSDateComponents()
        
        //Components.year = 1
        //let maxDate: NSDate = Calendar.dateByAddingComponents(Components, toDate: dateNow, options: nil)!
        //Components.year = 0
        //let minDate: NSDate = Calendar.dateByAddingComponents(Components, toDate: dateNow, options: nil)!
        
        //componentDatePicker.minimumDate = minDate
        //componentDatePicker.maximumDate = maxDate
    }
	
	func getViewWrapper() -> UIView{
		return componentDatePickerViewWrapper
	}
	
	func viewHidden(param: Bool){
        
        let bounds: CGRect!
        let alpha: CGFloat!
        let hidden: Bool!
        
        if(!param) {
            bounds = CGRectMake(0, 0, 320, 201)
            alpha = 1
            self.componentDatePickerViewWrapper.hidden = param
        } else {
            bounds = CGRectMake(0, -200, 320, 201)
            alpha = 0
        }
        
        UIView.animateWithDuration(0.2, delay: 0,
            options: .CurveEaseIn,
            animations: {
                self.componentDatePickerViewWrapper.bounds = bounds
                self.componentDatePickerViewWrapper.alpha = alpha
            },
            completion: { (complete: Bool) in
                if(!param) {
                    self.componentDatePickerViewWrapper.hidden = param
                }
            }
        )
	}
	
	func viewToggle(){
		if(componentDatePickerViewWrapper.hidden){
			self.viewHidden(false)
		} else {
			self.viewHidden(true)
		}
	}
	
	
	func showDatePicker(sender: UIButton) {
		self.viewHidden(false)
		self.setLabel(sender.currentTitle!)
	}
	
	func setLabel(text: String){
		labelDatePicker.text = text
	}
	
	func sendDate(){
        let dateFormater : NSDateFormatter = NSDateFormatter()
        let calendar: NSCalendar = NSCalendar.currentCalendar()
		dateFormater.dateFormat = "d MMMM"
        
        if(self.dateDatePicker != nil){
            let d = dateFormater.stringFromDate(self.dateDatePicker)
		
            if((datePickerDelegate) != nil){
                datePickerDelegate.datePickerChanged(d)
            }
        }
	}

}
