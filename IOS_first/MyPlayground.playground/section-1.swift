// Playground - noun: a place where people can play

import UIKit
import Alamofire

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






let parameters = [
    "hotel" : "182835",
    "ticket" : "777478415",
    "DepartureId" : "6733",
    "ArrivalId" : "6623",
    "StartVoyageDate" : "2014-11-12",
    "EndVoyageDate" : "2014-11-21",
    "TicketClass" : "0",
    "Adult" : "2",
    "HotelId" : "182835",
    "TicketId" : "777478415",
    "AddFilter" : "true"
]


/*
Alamofire.request(.GET, "http://api.test.inna.ru/api/v1", parameters: parameters)
    .response { (request, response, data, error) in
        println(request)
        println(response)
        println(error)
}
 */
