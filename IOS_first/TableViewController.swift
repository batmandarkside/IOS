//
//  TableViewController.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 23/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit


class DKTableViewController : UITableViewController {
	
	var myData = [
		"Thailand",
		"Moscow",
		"Germany",
		"Saint-Peterburg",
		"Italy"
	]
	
	
	var CountrySearch : [(id: Int, name: String, desc: String, time: Int)] = []
		
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	func test(name: String){
		println(name)
	}
	


	
	
	// Заполняем tableView данными
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let identifier = "myCell"
		
		//let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell
		
		var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as UITableViewCell
	

	
		//cell.imageView.image = UIImage(named: "test")
		cell.textLabel.text = myData[indexPath.row]
		var testHttp = DKHttp()
		
		return cell
	}
	
	
	// Удаление строки
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {

			myData.removeAtIndex(indexPath.row)
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		}
	}
	

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return myData.count
	}


	

}