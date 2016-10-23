//
//  SearchSuggest.swift
//  IOS_first
//
//  Created by dmitry on 19/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import RxSwift
import SDWebImage

class SearchSuggest: UIView, UITableViewDataSource, UITableViewDelegate, SearchInputProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    private var itemsCollection : [ContentModelItemMapper]?
    private var _pageNext = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.getNews()
        //PagingSpinner.appendSpinner(self.tableView)
    }
    

    
    
    func searchInputChanged(data: String) {
        print(data, "searchInputChanged")
    }

    
    
    // список новостей
    func getNews(){
        ServicesNews.getNews()
            .then { body -> Void in
                self.setPageItensAndReloadTableView(body as! NSDictionary)
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
        
        if(self.itemsCollection != nil && self.itemsCollection?.count > 0){
            self.itemsCollection?.appendContentsOf(_model!.items!)
        } else {
            self.itemsCollection = _model!.items!
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
                //PagingSpinner.hide()
            }
            .error { error in self.errorLoadContent()}
        
    }
    
    func errorLoadContent(){
    
    }
    
    
    /*
    ячейка секции
    Заполняем ее данными в этом методе
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let _newsItem  = self.itemsCollection![indexPath.row]
        let identifier = "suggestCell"
        
        // кастомный класс ячейки
        tableView.registerNib(UINib(nibName: "SearchSuggestCell", bundle: nil), forCellReuseIdentifier: identifier)
        let cell = (tableView.dequeueReusableCellWithIdentifier(identifier) as? SearchSuggestCell)!
        cell.labelOutlet?.text = _newsItem.getTitle()
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
        if(self.itemsCollection != nil){
            count = self.itemsCollection!.count
        }
        return count
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let lastRow = self.itemsCollection!.count - 1
        if(indexPath.row == lastRow) {
            if !self._pageNext.isEmpty {
                self.onEndReached(self._pageNext)
            }
        }
    }
}

