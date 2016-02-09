//
//  news_screen.swift
//  IOS_first
//
//  Created by Dmitry Kuznetsov on 2/7/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import UIKit
import ObjectMapper
import SDWebImage
import ReactiveCocoa

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var _newsModel : NewsModel!
    var isVisible : String = ""
    
    var activityIndicator = ActivityIndicator()
    let alert = UIAlertController(title: "Error", message: "Ошибка сервера", preferredStyle: .Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.activityIndicator.showActivityIndicator(self.view)
        self.alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: { (action) in
            self.goBack()
        }))
        
        self.navigationBarHidden()
        
        ServicesNews.getNews()
            .then { body -> Void in
                self._newsModel = Mapper<NewsModel>().map(body)
                self.navigationBarShow()
                
                // перезагрузаем tableView
                self.tableView.reloadData()
                Utils.TimeOut(1,
                    resolve : {
                        self.activityIndicator.hideActivityIndicator(self.view)
                    }
                )
                
                let visibleStateChanged = RACObserve(self._newsModel, keyPath: "count")
                
                
                visibleStateChanged.subscribeNext { (value) -> Void in
                    print(value)
                }
            }
            .error { error in
                self.presentViewController(self.alert, animated: true, completion: nil)
        }
        
        
        let testSignal : RACSignal = RACSignal.createSignal { (subscriber) -> RACDisposable! in
            var i = 0
            let Timer = Utils.Timer(duration: 1000, handler: { params -> Void in
                
                subscriber.sendNext(i++)
                
                if(i == 10){
                    subscriber.sendCompleted()
                }
            })
            
            Timer.start()
            
            
            return nil
            }
            .finally { () -> Void in
                print("finally")
                //Timer.stop()
        	}
        
        
        testSignal.doNext { (value) -> Void in
                        print(value, "doNext")
        }
        testSignal.subscribeNext { (value) -> Void in
            print(value, "subscribeNext")
        }
        
        //RACSignal
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func goBack(){
        //self.navigationController?.popToRootViewControllerAnimated(true)
        self.navigationBarShow()
    }
    
    
    func navigationBarHidden(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func navigationBarShow(){
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    ячейка секции
    Заполняем ее данными в этом методе
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let _newsItems = (self._newsModel?.items![indexPath.row])!
        let identifier = "myCell"
        
        // кастомный класс ячейки
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! DKViewCell!
        
        /*if(cell == nil){
        cell = DKViewCell(style: .Value1, reuseIdentifier: identifier)
        }*/
        
        cell.labelTitle?.text = _newsItems.getTitle()
        print(_newsItems.getTitle())
        
        cell.itemImage?.sd_setImageWithURL(
            _newsItems.getMainImage(),
            placeholderImage: UIImage(named :_newsItems.getNoImage()),
            options:SDWebImageOptions.RetryFailed)
        
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
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    /* количество секций в таблице */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /* колличество рядов в секции */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        
        if(self._newsModel != nil){
            count = (self._newsModel?.items!.count)!
        }
        return count
    }
    
    
}

