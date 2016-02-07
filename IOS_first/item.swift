//
//  item.swift
//  IOS_first
//
//  Created by dmitry on 05/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import ReactiveCocoa

class ViewCell: UITableViewCell, ReactiveView {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMap: UILabel!
    @IBOutlet weak var hotelImages: UIImageView!
    
    
    func bindViewModel(viewModel: AnyObject) {
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData() {
        
        self.labelTitle.text = ""
        
        /*cell.hotelImages.sd_setImageWithURL(
        Hotel.getImageUrl(),
        placeholderImage: Hotel.getNoImage(),
        options:SDWebImageOptions.RetryFailed)*/
    }
    
}
