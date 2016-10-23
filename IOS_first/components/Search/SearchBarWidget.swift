//
//  SearchBarWidget.swift
//  IOS_first
//
//  Created by dmitry on 18/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import UIKit

@IBDesignable class SearchBarWidget:  BaseWidgets, UISearchBarDelegate {
    
    var searchProtocol : SearchInputProtocol?
    @IBOutlet weak var searchBar: UISearchBar!

    override var nibName: String {
        get {
            return "SearchBarWidget"
        }
        set {
            super.nibName = newValue
        }
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		print(searchBar.text)
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        print(searchBar.text)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        print(searchBar.text, "searchBarCancelButtonClicked")
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        searchProtocol?.searchInputChanged(searchText)
        NSNotificationCenter.defaultCenter().postNotificationName("NotificationIdentifier", object: searchText)
    }

    
}
