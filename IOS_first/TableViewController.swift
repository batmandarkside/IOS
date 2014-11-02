//
//  TableViewController.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 23/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class DKTableViewController : UITableViewController, UITableViewDataSource, UITableViewDelegate {
	
    var myData : Array<JSON> = []
	
	var CountrySearch : [(id: Int, name: String, desc: String, time: Int)] = []
    var viewControllerUtils = ViewControllerUtils()
    
	
	override func viewDidLoad() {
		super.viewDidLoad()
		println("START")
        
        
        
        self.viewControllerUtils.showActivityIndicator(self.view)
        
        
        ServicesDP.getHotels(
            hotelSuccess: {(data: NSDictionary) in
                    println("SUCCESS")
                    var responseJSON = JSON(data)

                    let list: Array<JSON> = responseJSON["Hotels"].arrayValue
                
                if(!list.isEmpty) {
                    self.myData = list
                    
                    // перезагрузаем tableView
                    self.tableView.reloadData()
                }
                
            },
            hotelError: {
                println("ERROR")
            },
            complete : {
                Utils.TimeOut(2,
                    resolve : {
                        self.viewControllerUtils.hideActivityIndicator(self.view)
                    }
                )

            }
        )
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func test(name: String){
		println(name)
	}


	
	
	// Заполняем tableView данными
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let identifier = "myCell"    
		
        // кастомный класс ячейки
		var cell : HotelViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as HotelViewCell
	
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.purpleColor()
        } else {
            cell.backgroundColor = UIColor.orangeColor()
        }
        
        

	
		//cell.imageView.image = UIImage(named: "test")
		//cell.textLabel.text = myData[indexPath.row]

        var iurl: String = myData[indexPath.row]["HotelPhoto70"].stringValue
        let image_url = NSURL(fileURLWithPath: iurl)
        let image_data = NSData(contentsOfURL: image_url!)
        
        cell.labelTitle.text = myData[indexPath.row]["HotelName"].string

		
        /*dispatch_async(dispatch_get_main_queue(), {
            cell.hotelImages.image = UIImage(named: iurl)
        })*/
        
		return cell
	}
	
	
	// Удаление строки
    /*override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {

			myData.removeAtIndex(indexPath.row)
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		}
	}*/
	

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myData.count
	}


	

}