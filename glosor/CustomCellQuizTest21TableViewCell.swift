//
//  CustomCellQuizTest21TableViewCell.swift
//  glosor
//
//  Created by malgorzata wikström on 2016-03-25.
//  Copyright © 2016 malgorzata wikström. All rights reserved.
//

import UIKit

class CustomCellQuizTest21TableViewCell: UITableViewCell, UITextFieldDelegate {
    
    //elements i cellen
    @IBOutlet weak var WordToTranslate: UITextField!
    
    @IBOutlet weak var TheTranslatedWord: UITextField!
    
    @IBOutlet weak var ImageToShow: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageToShow.backgroundColor = UIColor(patternImage: UIImage(named: "checkMark.png")!)
        ImageToShow.hidden = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.WordToTranslate.delegate = self
        self.TheTranslatedWord.delegate = self
        WordToTranslate.textColor = UIColor.blackColor()
        TheTranslatedWord.textColor = UIColor.blackColor()
        TheTranslatedWord.placeholder = "ditt svar"
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        WordToTranslate.resignFirstResponder()
        TheTranslatedWord.resignFirstResponder()
        return true
    }
    
    
    
    


}
