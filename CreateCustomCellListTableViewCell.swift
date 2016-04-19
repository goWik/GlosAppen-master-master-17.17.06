//
//  CreateCustomCellListTableViewCell.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-17.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CreateCustomCellListTableViewCell: UITableViewCell {
    
    
    //custom cell elements:
    @IBOutlet weak var LabelLanguage1: UILabel!
    
    @IBOutlet weak var LabelWord1: UILabel!
    
    @IBOutlet weak var LabelLanguage2: UILabel!
    
    @IBOutlet weak var LabelWord2: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
