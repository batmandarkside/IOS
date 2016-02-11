//
//  item.swift
//  IOS_first
//
//  Created by dmitry on 05/02/16.
//  Copyright © 2016 дмитрий кузнецов. All rights reserved.
//

import Foundation
import UIKit

class DKViewCell: UITableViewCell {
    
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellRubricButton: UIButton!
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
