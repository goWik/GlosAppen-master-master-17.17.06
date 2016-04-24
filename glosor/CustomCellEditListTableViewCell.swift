//
//  CustomCellEditListTableViewCell.swift
//  glosor
//
//  Created by gm on 2016-03-26.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CustomCellEditListTableViewCell: UITableViewCell {
    
    //:MARK ELEMENTS:
    @IBOutlet weak var LabelLanguage1: UILabel!

    @IBOutlet weak var LabelLanguage2: UILabel!
    //textFiled - ord som ska/kan redigeras
    @IBOutlet weak var TextFiledWord1: UITextField!
  
    @IBOutlet weak var TextFiledWord2: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LabelLanguage1.textColor = UIColor.blackColor()
        LabelLanguage2.textColor = UIColor.blackColor()
        TextFiledWord1.textColor = UIColor.blackColor()
        TextFiledWord2.textColor = UIColor.blackColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
