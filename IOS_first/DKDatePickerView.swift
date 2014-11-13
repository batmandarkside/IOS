//
//  DKDatePickerView.swift
//

import UIKit

class DKDatePickerView: UIView {

	
	@IBOutlet weak var componentDatePicker: UIDatePicker!
	@IBOutlet weak var componentDatePickerViewWrapper: UIView!
	@IBOutlet weak var labelDatePicker: UILabel!
	weak var testDelegate: DKDatePickerViewProtocol!
	private var dateDatePicker: NSDate!
	
	
	@IBAction func actionDone(sender: UIButton) {
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
		componentDatePickerViewWrapper.hidden = true
    }
	
	func getViewWrapper() -> UIView{
		return componentDatePickerViewWrapper
	}
	
	func viewHidden(param: Bool){
		componentDatePickerViewWrapper.hidden = param
	}
	
	func viewToggle(){
		if(componentDatePickerViewWrapper.hidden){
			self.viewHidden(false)
		} else {
			self.viewHidden(true)
		}
	}
	
	
	func showDatePicker(sender: UIButton) {
		if(componentDatePickerViewWrapper.hidden) {
			componentDatePickerViewWrapper.hidden = false
		}
		self.setLabel(sender.currentTitle!)
	}
	
	func setLabel(text: String){
		labelDatePicker.text = text
	}
	
	func sendDate(){
		let dateFormater : NSDateFormatter = NSDateFormatter()
		let calendar: NSCalendar = NSCalendar.currentCalendar()
		dateFormater.dateFormat = "d MMMM"
		let d = dateFormater.stringFromDate(self.dateDatePicker)
		
		if((testDelegate) != nil){
			testDelegate.datePickerChanged(d)
		}
	}

}
