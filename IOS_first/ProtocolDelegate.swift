//
//  ProtocolDelegate.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 12/11/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation


protocol EventManagerDelegate : class {
	var fullName: String { get }
	func someMethod()
}