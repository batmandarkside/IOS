//
//  DKDatePickerView.swift
//

import UIKit

class DKDatePickerView: UIView {

	
	@IBOutlet weak var componentDatePicker: UIDatePicker!
	@IBOutlet weak var componentDatePickerViewWrapper: UIView!
	@IBOutlet weak var labelDatePicker: UILabel!
	
	
	@IBAction func actionDone(sender: UIButton) {
			self.viewHidden(true)
	}
	
	@IBAction func actionCancel(sender: UIButton) {
			self.viewHidden(true)
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
	

}
