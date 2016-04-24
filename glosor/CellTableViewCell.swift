//
//  CellTableViewCell.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-10.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    //:MARK ELEMENTS
    @IBOutlet weak var TextLabelOutlet: UILabel!
    
    @IBOutlet weak var TextLabelDatum: UILabel!
    
    @IBOutlet weak var ImageView: UIView!
    
    
    
    let myGreenColor = UIColor(red: 51.0/255.0, green: 173.0/255.0, blue: 100.0/255.0, alpha: 1.0)
        
    override func awakeFromNib() {
        super.awakeFromNib()
        TextLabelOutlet.textColor = UIColor.darkGrayColor()
        TextLabelDatum.textColor = myGreenColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     }
    
}
