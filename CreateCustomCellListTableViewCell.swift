//
//  CreateCustomCellListTableViewCell.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-17.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CreateCustomCellListTableViewCell: UITableViewCell {
    
    
    //:MARK ELEMENTS
    @IBOutlet weak var LabelLanguage1: UILabel!
    
    @IBOutlet weak var LabelWord1: UILabel!
    
    @IBOutlet weak var LabelLanguage2: UILabel!
    
    @IBOutlet weak var LabelWord2: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LabelLanguage1.textColor = UIColor.blackColor()
        LabelLanguage2.textColor = UIColor.blackColor()
        LabelWord1.textColor = UIColor.blackColor()
        LabelWord2.textColor = UIColor.blackColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
