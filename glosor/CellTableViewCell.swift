//
//  CellTableViewCell.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-10.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    //cutoms cell elemnts
    @IBOutlet weak var TextLabelOutlet: UILabel!
    
    @IBOutlet weak var TextLabelDatum: UILabel!
    
    @IBOutlet weak var ImageView: UIView!
        
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
     
    }
    



}
