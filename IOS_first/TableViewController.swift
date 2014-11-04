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
	
    private var myData : Array<JSON> = []
    private var modelHotel: [ModelHotel] = []
	
	var CountrySearch : [(id: Int, name: String, desc: String, time: Int)] = []
    var activityIndicator = ActivityIndicator()
    let alert = UIAlertController(title: "Error", message: "Ошибка сервера", preferredStyle: .Alert)
    let collectionHotel = CollectionHotels()
    
	
	override func viewDidLoad() {
		super.viewDidLoad()
        
        self.activityIndicator.showActivityIndicator(self.view)
        self.alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: { (action) in
            self.goBack()
        }))
        
        self.navigationBarHidden()
        
        // получаем даные с сервера - collectionHotel.fetch()
        // обновляем данные view  - self.tableView.reloadData()
        
        collectionHotel.fetch({
                self.myData = self.collectionHotel.getCollection()
                self.modelHotel = self.collectionHotel.getCollectionModel()
            
                println(self.modelHotel.isEmpty)
                if(!self.myData.isEmpty) {
                    // перезагрузаем tableView
                    self.tableView.reloadData()
                } else {
                    self.activityIndicator.hideActivityIndicator(self.view)
                    self.presentViewController(self.alert, animated: true, completion: nil)
                }
            
                self.navigationBarShow()
                Utils.TimeOut(2,
                    resolve : {
                        self.activityIndicator.hideActivityIndicator(self.view)
                    }
                )
            },
            {
                println("FAIL")
                self.activityIndicator.hideActivityIndicator(self.view)
                self.presentViewController(self.alert, animated: true, completion: nil)
        })

	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
    
    func navigationBarHidden(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func navigationBarShow(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    func goBack(){
        self.navigationController?.popToRootViewControllerAnimated(true)
        self.navigationBarShow()
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
        
        /*if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.purpleColor()
        } else {
            cell.backgroundColor = UIColor.orangeColor()
        }*/

        
        cell.labelTitle.text =  self.myData[indexPath.row]["HotelName"].stringValue
        //cell.labelTitle.text = self.modelHotel[indexPath.row].getName()
        //println(self.modelHotel[indexPath.row].getName())

        
        //self.activityIndicator.showActivityIndicator(cell.hotelImages, styleIndicator: .White)

		// грузим картинки
        /*dispatch_async(dispatch_get_main_queue(), {
            var iurl: String = self.myData[indexPath.row]["HotelPhoto70"].stringValue
            let image_url = NSURL(string: iurl) //NSURL(fileURLWithPath: iurl)
            let image_data = NSData(contentsOfURL: image_url!)
            let image = UIImage(data: image_data!)
            cell.hotelImages.image = image
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
		return self.modelHotel.count
	}


	

}