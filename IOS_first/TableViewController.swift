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
        
        //ServicesDP.getHotelsAfNetworking()
        
        collectionHotel.fetch({
                self.myData = self.collectionHotel.getCollection()
                self.modelHotel = self.collectionHotel.getCollectionModel()
            

                // перезагрузаем tableView
                self.tableView.reloadData()
                self.navigationBarShow()
            
                Utils.TimeOut(1,
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
        
        
        var testDate: NSDate = NSDate()
        var dateFormater : NSDateFormatter = NSDateFormatter()
        dateFormater.dateStyle = .ShortStyle
        println(dateFormater.stringFromDate(testDate))
        
        var myCalendar: NSCalendar = NSCalendar.currentCalendar()
        var myDateComponents: NSDateComponents = myCalendar.components(
            NSCalendarUnit.CalendarUnitYear|NSCalendarUnit.CalendarUnitMonth|NSCalendarUnit.CalendarUnitDay, fromDate: testDate)
        //println(dateFormater.dateFromString("2014/11/06 12:05"))
        println(myDateComponents)
        
        var timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "timerTest:", userInfo: nil, repeats: true)
    
        //timer.fireDate(testDate.timeIntervalSinceNow)

        /*
        static var CalendarUnitYear: NSCalendarUnit { get }
        static var CalendarUnitMonth: NSCalendarUnit { get }
        static var CalendarUnitDay: NSCalendarUnit { get }
        static var CalendarUnitHour: NSCalendarUnit { get }
        static var CalendarUnitMinute: NSCalendarUnit { get }
        static var CalendarUnitSecond: NSCalendarUnit { get }
        static var CalendarUnitWeekday: NSCalendarUnit { get }
        */
	}
    
    func timerTest(timer: NSTimer){
        var dateFormater : NSDateFormatter = NSDateFormatter()
        dateFormater.dateFormat = "HH:mm:ss:SSS"
        //println(dateFormater.stringFromDate(NSDate()))
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
        
        let image_url = NSURL(string: self.myData[indexPath.row]["HotelPhoto70"].stringValue)
        let placeholder = UIImage(named: "no_photo_hotel.png")
        //cell.hotelImages.sd_setImageWithURL(image_url, placeholderImage: placeholder)
        cell.hotelImages.sd_setImageWithURL(image_url, placeholderImage: placeholder, options:SDWebImageOptions.RetryFailed)         
       
        
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
    
    
    // AFNetworking
    
    /*cell.hotelImages.setImageWithURLRequest(url_request, placeholderImage: placeholder,
    success: {[weak cell] (request:NSURLRequest!,response:NSHTTPURLResponse!, image:UIImage!) -> Void in
    if let cell_for_image = cell {
    cell_for_image.imageView.image = image
    cell_for_image.setNeedsLayout()
    }
    },
    failure: {[weak cell](request:NSURLRequest!,response:NSHTTPURLResponse!, error:NSError!) -> Void in
    if let cell_for_image = cell {
    cell_for_image.imageView.image = nil
    cell_for_image.imageView.cancelImageRequestOperation()
    cell_for_image.setNeedsLayout()
    }
    })*/
}