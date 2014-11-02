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



func log(txt: String, #resolve: () -> (), #reject: () -> ()) {
    var delta: Int64 = 1 * Int64(NSEC_PER_SEC)
    var time = dispatch_time(DISPATCH_TIME_NOW, delta)

    
    dispatch_after(time, dispatch_get_main_queue(), {
        println("closures are " + txt)
        resolve()
    });
}

log("not the same as JS closures",
    resolve: {
        println("and done 11")
    },
    reject: {
        // handle errors
})



func log(txt: String, completion: () -> ()) {
    var delta = Int64(1 * Double(NSEC_PER_SEC))
    var time = dispatch_time(DISPATCH_TIME_NOW, delta)


    dispatch_after(time, dispatch_get_main_queue()) {
        println("closures are " + txt)
        
    }
}

log("not the same as JS closures") {
    println("and done kjdhsdf")
}


func myCallback(paramString: String?, #completion: (() ->())?){
    println("Start Completion \(paramString)")
    if(completion != nil){
        completion!()
    }
    
    println("Stop")
}

myCallback("",
    completion: {
        println("adsdfsdf")
    }
)

