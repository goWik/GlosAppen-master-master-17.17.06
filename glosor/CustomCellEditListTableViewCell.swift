//
//  CustomCellEditListTableViewCell.swift
//  glosor
//
//  Created by gm on 2016-03-26.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CustomCellEditListTableViewCell: UITableViewCell {
    
    //custom cell elemnts består av:
    //labels för att sätta till språk
    @IBOutlet weak var LabelLanguage1: UILabel!

    @IBOutlet weak var LabelLanguage2: UILabel!
  
    //textFiled - ord som ska/kan redigeras
    @IBOutlet weak var TextFiledWord1: UITextField!
  
    @IBOutlet weak var TextFiledWord2: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
