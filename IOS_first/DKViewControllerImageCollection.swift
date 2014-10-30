//
//  ViewControllerImageCollection.swift
//  IOS_first
//
//  Created by Dmitry KUZNETSOV on 28/10/14.
//  Copyright (c) 2014 дмитрий кузнецов. All rights reserved.
//

import UIKit

class DkViewControllerImageCollection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
	
	var collectionImages : [String] = []
	let identifier = "cell"
	
	var name : AnyObject? {
		get {
			return NSUserDefaults.standardUserDefaults().objectForKey("name")
		}
		set {
			NSUserDefaults.standardUserDefaults().setObject(newValue!, forKey: "name")
			NSUserDefaults.standardUserDefaults().synchronize()
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		collectionImages = [
			"hotel.jpg", "hotel.png", "test.jpg", "test.png",
			"hotel.jpg", "hotel.png", "test.jpg", "test.png",
			"hotel.jpg", "hotel.png", "test.jpg", "test.png",
			"hotel.jpg", "hotel.png", "test.jpg", "test.png",
			"hotel.jpg", "hotel.png", "test.jpg", "test.png",
			"hotel.jpg", "hotel.png", "test.jpg", "test.png",
			"hotel.jpg", "hotel.png", "test.jpg", "test.png",
			"hotel.jpg", "hotel.png", "test.jpg", "test.png"
		]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// задаем колличество яцеек для вывода на экран
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return collectionImages.count
	}
	
	// метод отображения ячейки на экране
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		
		var cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as DKImageCell
		
		cell.imageView.image = UIImage(named: collectionImages[indexPath.row])
		
		return cell
	}
	
	// момент выбора ячейки
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		
		// чтобы передать данные в другую форму
		// воспользуемся NSUserDefault
		name = collectionImages[indexPath.row]
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
