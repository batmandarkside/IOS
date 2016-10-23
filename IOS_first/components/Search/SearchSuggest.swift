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


class SearchSuggest: UIView, UITableViewDataSource, UITableViewDelegate, SearchInputProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var itemsCollection : [ContentModelItemMapper]?
    fileprivate var _pageNext = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.getNews()
        //PagingSpinner.appendSpinner(self.tableView)
    }
    

    
    
    func searchInputChanged(_ data: String) {
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
    func setPageItensAndReloadTableView(_ data : NSDictionary) {
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
    func onEndReached(_ url : String){
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let _newsItem  = self.itemsCollection![(indexPath as NSIndexPath).row]
        let identifier = "suggestCell"
        
        // кастомный класс ячейки
        tableView.register(UINib(nibName: "SearchSuggestCell", bundle: nil), forCellReuseIdentifier: identifier)
        let cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as? SearchSuggestCell)!
        cell.labelOutlet?.text = _newsItem.getTitle()
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
        if(self.itemsCollection != nil){
            count = self.itemsCollection!.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRow = self.itemsCollection!.count - 1
        if((indexPath as NSIndexPath).row == lastRow) {
            if !self._pageNext.isEmpty {
                self.onEndReached(self._pageNext)
            }
        }
    }
}

