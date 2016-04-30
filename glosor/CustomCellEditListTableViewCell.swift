//
//  CustomCellEditListTableViewCell.swift
//  glosor
//
//  Created by gm on 2016-03-26.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CustomCellEditListTableViewCell: UITableViewCell {
    
    //MARK: ELEMENTS:
    @IBOutlet weak var LabelLanguage1: UILabel!
    
    @IBOutlet weak var LabelLanguage2: UILabel!
    //TextField - ord som ska/kan redigeras
    @IBOutlet weak var TextFieldWord1: UITextField!
    
    @IBOutlet weak var TextFieldWord2: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LabelLanguage1.textColor = UIColor.blackColor()
        LabelLanguage2.textColor = UIColor.blackColor()
        TextFieldWord1.textColor = UIColor.blackColor()
        TextFieldWord2.textColor = UIColor.blackColor()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
