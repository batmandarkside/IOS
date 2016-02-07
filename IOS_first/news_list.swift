//
//  TableViewController.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 23/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit



class NewsTableViewController : UITableViewController {
    
    private var _newsModel : NewsModel?
    
    var CountrySearch : [(id: Int, name: String, desc: String, time: Int)] = []
    var activityIndicator = ActivityIndicator()
    let alert = UIAlertController(title: "Error", message: "Ошибка сервера", preferredStyle: .Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.showActivityIndicator(self.view)
        
        self.alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: { (action) in
            self.goBack()
        }))
        
        
        
        self.navigationBarHidden()
        ServicesNews.getNews()
            .then { body -> Void in
                self._newsModel = NewsModel(data : body);
                self.navigationBarShow()
                
                // перезагрузаем tableView
                self.tableView.reloadData()
                Utils.TimeOut(1,
                    resolve : {
                        self.activityIndicator.hideActivityIndicator(self.view)
                    }
                )
            }
            .error { eror in
                self.presentViewController(self.alert, animated: true, completion: nil)
        }
        
    }
    
    
    func timerTest(timer: NSTimer){
        let dateFormater : NSDateFormatter = NSDateFormatter()
        dateFormater.dateFormat = "HH:mm:ss:SSS"
        //print(dateFormater.stringFromDate(NSDate()))
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
        
        
        let _newsItem = (self._newsModel?.getItem(indexPath.row))!
        let identifier = "myCell"
        
        // кастомный класс ячейки
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! ViewCell!
        
        if(cell == nil){
            cell = ViewCell(style: .Value1, reuseIdentifier: identifier)
        }
        
        cell.labelTitle.text = _newsItem.get("title")
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
        var count = 0
        
        if(self._newsModel != nil){
            count = (self._newsModel?.getProps("items").count)!
        }
        return count
    }
}