//
//  SearchSuggestCell.swift
//  IOS_first
//
//  Created by dmitry on 19/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit

class SearchSuggestCell: UITableViewCell {
    


    @IBOutlet weak var labelOutlet: UILabel!
   
    @IBOutlet weak var lable: UILabel!
    
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
}
