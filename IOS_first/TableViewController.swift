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
    var activityIndicator = ActivityIndicator()
    let alert = UIAlertController(title: "Error", message: "Ошибка сервера", preferredStyle: .Alert)
    
	
	override func viewDidLoad() {
		super.viewDidLoad()
		println("START")
        
        
        
        self.activityIndicator.showActivityIndicator(self.view)
        self.alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: nil))
        
        
        ServicesDP.getHotels(
            hotelSuccess: {(data: NSDictionary) in
                println("SUCCESS")
                var responseJSON = JSON(data)

                let list: Array<JSON> = responseJSON["Hotels"].arrayValue
                
                if(!list.isEmpty) {
                    self.myData = list

                    // перезагрузаем tableView
                    self.tableView.reloadData()
                } else {
                    self.activityIndicator.hideActivityIndicator(self.view)
                    self.presentViewController(self.alert, animated: true, completion: nil)
                }
                
            },
            hotelError: {
                println("ERROR")
            },
            complete : {
                Utils.TimeOut(2,
                    resolve : {
                        self.activityIndicator.hideActivityIndicator(self.view)
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


	
		
    /* 
    ячейка секции
    Заполняем ее данными в этом методе
    */
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let identifier = "myCell"    
		
        // кастомный класс ячейки
		var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as HotelViewCell!
        
        if(cell == nil){
            cell = HotelViewCell(style: .Value1, reuseIdentifier: identifier)
            println("Create")
        } else {
            println("Reuse")
        }
        //var TestCell = HotelViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.purpleColor()
        } else {
            cell.backgroundColor = UIColor.orangeColor()
        }
        
        

	
		//cell.imageView.image = UIImage(named: "test")
		//cell.textLabel.text = myData[indexPath.row]

        
        cell.labelTitle.text = myData[indexPath.row]["HotelName"].string
        



        
        //self.activityIndicator.showActivityIndicator(cell.hotelImages, styleIndicator: .White)
        

		// грузим картинки
        dispatch_async(dispatch_get_main_queue(), {
            var iurl: String = self.myData[indexPath.row]["HotelPhoto70"].stringValue
            let image_url = NSURL(string: iurl) //NSURL(fileURLWithPath: iurl)
            let image_data = NSData(contentsOfURL: image_url!)
            let image = UIImage(data: image_data!)
            cell.hotelImages.image = image
        })
        
		return cell
	}
	
	
	// Удаление строки
    /*override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {

			myData.removeAtIndex(indexPath.row)
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		}
	}*/
	
    
    /* заголовок секции */
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return ""
    }
    
    
    /* количество секций в таблице */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    /* колличество рядов в секции */
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myData.count
	}


	

}