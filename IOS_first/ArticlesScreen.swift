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
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class ArticlesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    fileprivate var _newsItems : [ContentModelItemMapper]?
    fileprivate var _pageNext = ""
    
    var activityIndicator = ActivityIndicator()
    
    let alert = UIAlertController(title: "Error", message: "Ошибка сервера", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.activityIndicator.show(self.view)
        self.alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
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
                
                Utils.TimeOut(0.3,
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
    func setPageItensAndReloadTableView(_ data : NSDictionary) {
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
    func onEndReached(_ url : String){
        PagingSpinner.show()
        ServicesNews.getNewsByUrl(url)
            .then { body -> Void in
                
                self.setPageItensAndReloadTableView(body as! NSDictionary)
                PagingSpinner.hide()
            }
            .error { error in self.errorLoadContent()}
        
    }
    
    func errorLoadContent(){
        self.present(self.alert, animated: true, completion: nil)
    }
    
    
    /*
    ячейка секции
    Заполняем ее данными в этом методе
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let _newsItem  = self._newsItems![(indexPath as NSIndexPath).row]
        let identifier = "myCell"
        
        // кастомный класс ячейки
        //var cell : DKViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as! DKViewCell!
        tableView.register(UINib(nibName: "cell", bundle: nil), forCellReuseIdentifier: identifier)
        let cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as? DKViewCell)!
        
        cell.cellText?.text = _newsItem.getTitle()
        cell.cellRubricButton?.setTitle(_newsItem.getMainTagTitle(), for: UIControlState())
        //print(_newsItem.getTitle())
        
        cell.cellImage?.sd_setImage(
            with: _newsItem.getMainImage() as URL,
            placeholderImage: UIImage(named :_newsItem.getNoImage()),
            options:SDWebImageOptions.retryFailed)
        
        return cell
    }
    
    
    /* заголовок секции */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    
    /* количество секций в таблице */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /* колличество рядов в секции */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if(self._newsItems != nil){
            count = self._newsItems!.count
        }
        return count
    }
    
    //func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    //    <#code#>
    //}
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRow = self._newsItems!.count - 1
        if((indexPath as NSIndexPath).row == lastRow) {
            if !self._pageNext.isEmpty {
                print("LOAD MORE", self._pageNext)
                self.onEndReached(self._pageNext)
            }
        }
    }
}

