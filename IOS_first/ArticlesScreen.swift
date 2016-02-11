//
//  news_screen.swift
//  IOS_first
//
//  Created by Dmitry Kuznetsov on 2/7/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import UIKit
import ObjectMapper
import RxSwift
import SDWebImage

class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var _newsItems : [ContentModelItemMapper]?
    private var _pageNext = ""
    
    var activityIndicator = ActivityIndicator()
    
    let alert = UIAlertController(title: "Error", message: "Ошибка сервера", preferredStyle: .Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.activityIndicator.show(self.view)
        self.alert.addAction(UIAlertAction(title: "ok", style: .Default, handler: { (action) in
            self.goBack()
        }))
        
        self.navigationBarHidden()
        self.getNews()
        PagingSpinner.appendSpinner(self.tableView)
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
    
    
    // список новостей
    func getNews(){
        ServicesNews.getNews()
            .then { body -> Void in
                self.setPageItensAndReloadTableView(body as! NSDictionary)
                
                Utils.TimeOut(1,
                    resolve : {
                        self.activityIndicator.hide(self.view)
                        self.navigationBarShow()
                    }
                )
            }
            .error { error in self.errorLoadContent()}
        
    }
    
    /**
     Получаем список новостей
     создаем модель, достаем сам список и дальше работает с ним
     если список не пустой, то добавляем к нему новые элементы
     */
    func setPageItensAndReloadTableView(data : NSDictionary) {
        let _model = Mapper<ContentModel>().map(data)
        
        if(self._newsItems != nil && self._newsItems?.count > 0){
            self._newsItems?.appendContentsOf(_model!.items!)
        } else {
            self._newsItems = _model!.items!
        }
        
        
        self._pageNext = _model!.getPageNext()
        // перезагрузаем tableView
        self.tableView.reloadData()
    }
    
    // список новостей по доскроллу
    // TODO : доработать
    func onEndReached(url : String){
        PagingSpinner.show()
        ServicesNews.getNewsByUrl(url)
            .then { body -> Void in
                
                self.setPageItensAndReloadTableView(body as! NSDictionary)
                PagingSpinner.hide()
            }
            .error { error in self.errorLoadContent()}
        
    }
    
    func errorLoadContent(){
        self.presentViewController(self.alert, animated: true, completion: nil)
    }
    
    
    /*
    ячейка секции
    Заполняем ее данными в этом методе
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let _newsItem  = self._newsItems![indexPath.row]
        let identifier = "myCell"
        
        // кастомный класс ячейки
        //var cell : DKViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as! DKViewCell!
        tableView.registerNib(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: identifier)
        let cell = (tableView.dequeueReusableCellWithIdentifier(identifier) as? DKViewCell)!
        
        cell.cellText?.text = _newsItem.getTitle()
        cell.cellRubricButton?.setTitle(_newsItem.getMainTagTitle(), forState: .Normal)
        //print(_newsItem.getTitle())
        
        cell.cellImage?.sd_setImageWithURL(
            _newsItem.getMainImage(),
            placeholderImage: UIImage(named :_newsItem.getNoImage()),
            options:SDWebImageOptions.RetryFailed)
        
        return cell
    }
    
    
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
        if(self._newsItems != nil){
            count = self._newsItems!.count
        }
        return count
    }
    
    //func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //    <#code#>
    //}
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let lastRow = self._newsItems!.count - 1
        if(indexPath.row == lastRow) {
            if !self._pageNext.isEmpty {
                print("LOAD MORE", self._pageNext)
                self.onEndReached(self._pageNext)
            }
        }
    }
}

