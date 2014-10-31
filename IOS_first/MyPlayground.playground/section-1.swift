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
