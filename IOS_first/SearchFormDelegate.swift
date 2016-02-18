//
//  DKDatePickerDelegate.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 13/11/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation

protocol SearchInputProtocol: class {
    func searchInputChanged(data: String)
}

protocol DKDatePickerViewProtocol: class {
	func datePickerChanged(data: String)
}

protocol DKPopoverViewControllerDelegate: class {
    func getPassengersData() -> NSDictionary
}