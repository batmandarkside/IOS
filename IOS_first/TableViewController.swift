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
	
	var recipies = [
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


	
	
	/*override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

		let identifier = "cell"

		var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as UITableViewCell
		
		//println(cell)
		
		if cell == nil {
			cell = UITableViewCell(style: UITableViewStyle.Value1, reuseIdentifier: identifier)
		}
		
		//cell.imageView.image = UIImage(named: "test")
		cell.textLabel.text = recipies[indexPath.row]
		
		return cell
	}


	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return recipies.count
	}

*/
	
	override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
		
		let identifier = "cell"
		
		var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as UITableViewCell

		if cell == nil {
			cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
		}

		cell.textLabel.text = recipes[indexPath!.row]
		
		return cell
	}

}