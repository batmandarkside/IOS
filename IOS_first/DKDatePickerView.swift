//
//  DKDatePickerView.swift
//

import UIKit

class DKDatePickerView: UIView {

	
	@IBOutlet weak var componentDatePicker: UIDatePicker!
	@IBOutlet weak var componentDatePickerViewWrapper: UIView!
	@IBOutlet weak var labelDatePicker: UILabel!
	
    weak var datePickerDelegate: DKDatePickerViewProtocol!
    fileprivate var dateDatePicker: Date!
	
	
	@IBAction func actionDone(_ sender: UIButton) {
        if(self.dateDatePicker == nil) {
            self.dateDatePicker = componentDatePicker.date
        }
        self.sendDate()
        self.viewHidden(true)
	}
	
	@IBAction func actionCancel(_ sender: UIButton) {
		self.viewHidden(true)
	}
	
	
	@IBAction func actionValueChangedDatePicker(_ sender: UIDatePicker) {
		self.dateDatePicker = sender.date
	}

	// Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code

        self.minMaxDateCalendar()

        componentDatePickerViewWrapper.bounds = CGRect(x: 0, y: -200, width: 320, height: 201)
        componentDatePickerViewWrapper.alpha = 0
        componentDatePickerViewWrapper.isHidden = true
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
	
	func viewHidden(_ param: Bool){
        
        let bounds: CGRect!
        let alpha: CGFloat!
        let hidden: Bool!
        
        if(!param) {
            bounds = CGRect(x: 0, y: 0, width: 320, height: 201)
            alpha = 1
            self.componentDatePickerViewWrapper.isHidden = param
        } else {
            bounds = CGRect(x: 0, y: -200, width: 320, height: 201)
            alpha = 0
        }
        
        UIView.animate(withDuration: 0.2, delay: 0,
            options: .curveEaseIn,
            animations: {
                self.componentDatePickerViewWrapper.bounds = bounds
                self.componentDatePickerViewWrapper.alpha = alpha
            },
            completion: { (complete: Bool) in
                if(!param) {
                    self.componentDatePickerViewWrapper.isHidden = param
                }
            }
        )
	}
	
	func viewToggle(){
		if(componentDatePickerViewWrapper.isHidden){
			self.viewHidden(false)
		} else {
			self.viewHidden(true)
		}
	}
	
	
	func showDatePicker(_ sender: UIButton) {
		self.viewHidden(false)
		self.setLabel(sender.currentTitle!)
	}
	
	func setLabel(_ text: String){
		labelDatePicker.text = text
	}
	
	func sendDate(){
        let dateFormater : DateFormatter = DateFormatter()
        let calendar: Calendar = Calendar.current
		dateFormater.dateFormat = "d MMMM"
        
        if(self.dateDatePicker != nil){
            let d = dateFormater.string(from: self.dateDatePicker)
		
            if((datePickerDelegate) != nil){
                datePickerDelegate.datePickerChanged(d)
            }
        }
	}

}
