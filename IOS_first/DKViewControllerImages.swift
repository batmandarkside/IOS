//
//  DKViewControllerImages.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 28/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

// добавить обязательные методы
class DKViewControllerImages: UIViewController {

	@IBOutlet weak var newImgView: UIImageView!
	
	
	var name : AnyObject? {
		get {
			return NSUserDefaults.standardUserDefaults().objectForKey("name")
		}	
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		// явно сообщаем тип параметра
		newImgView.image = UIImage(named: name as String)
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

}
