// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func test(name: String!, testInt : Int) -> String {
	
	if (name == nil) {
		println("nil")
	}
	
	return name
}

var t = test("", 345)


let toInt =  "123"

let intTest5 : Int? = toInt.toInt()


// intTest6 не видно за пределами if
if  intTest5 == nil {
	println("works! \(intTest5)")
}

func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
	let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
	
	// Configure the cell...
	
	return cell
}

//let intTest6: Int = toInt.toInt()
/*
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
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let identifier = "cell"
		
		var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(identifier) as UITableViewCell
		
		if !cell {
			cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
		}
		
		//cell.textLabel.text = recipes[indexPath!.row]
		
		return cell
	}
	
}*/